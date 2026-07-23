# Flutter 项目协作规范

本文定义可复用的 Flutter 工程基线，适用于当前目录及其子目录；下级 `AGENTS.md` 可补充业务约束，冲突时以层级更深者为准。

## 1. 执行边界

- Codex 仅可执行不调用 Dart/Flutter 的只读检查，并以 `apply_patch` 修改代码。禁止直接或间接调用 `dart`、`flutter`（含脚本、IDE、任务系统和包装器）；仅可提供完整命令供用户执行。
- 交付时须声明格式化、静态分析、测试及构建均未执行，且不得宣称通过。
- 可直接修改 `pubspec.yaml`。采用第 2.2 节基础栈依赖无需确认；引入、移除或升级表外依赖前，须说明用途、既有替代方案和影响范围，并取得明确授权。
- 禁止手改 `.g.dart`、`.freezed.dart` 等生成产物；源文件变更后仅提供完整生成命令。

## 2. 技术选型

### 2.1 选型原则

- `pubspec.yaml` 是依赖及版本的事实源；第 2.2 节记录基线版本。调整时须同步两处，冲突以 `pubspec.yaml` 为准。
- 默认采用 `hooks_riverpod` + `flutter_hooks`；Provider 须手写，禁止 Riverpod 注解及其代码生成。
- 优先复用基础栈与既有依赖，降低样板代码；既有库可满足需求时，禁止引入同类库或重复实现核心能力。
- 依赖按需安装，不得一次性全量安装或预装未使用能力；表外业务依赖仅在必要且获用户确认后引入。

### 2.2 通用基础栈

| 职责 | 指定依赖及版本 | 规则 |
| --- | --- | --- |
| 状态管理与依赖注入 | `hooks_riverpod: ^3.3.2` | 默认架构；Provider 手写，禁止 Riverpod 注解及其代码生成 |
| 页面局部状态与生命周期 | `flutter_hooks: ^0.21.3+1` | 默认架构；Hook 优先管理控制器、焦点、监听及局部 UI 状态 |
| HTTP 与 API 声明 | `dio: ^5.10.0`、`retrofit: ^4.9.2` | Dio 统一配置；Retrofit 声明接口；业务层不得直接拼装 HTTP 请求 |
| 不可变模型与 JSON | `freezed_annotation: ^3.1.0`、`json_annotation: ^4.12.0` | 使用 Freezed 建模，Remote DTO 使用 JSON 映射 |
| 代码生成 | `build_runner: ^2.15.1`、`freezed: ^3.2.6-dev.1`、`json_serializable: ^6.14.0`、`retrofit_generator: ^10.2.7` | 仅生成对应源文件，禁止编辑生成产物 |
| 本地数据库 | `drift: ^2.34.1`、`drift_flutter: ^0.3.1`、`drift_dev: 2.34.0` | 结构化、可查询数据使用 Drift，并维护版本迁移 |
| 轻量键值存储 | `shared_preferences: ^2.5.5` | 仅存设置、标记等小型非敏感数据 |
| 网络日志 | `pretty_dio_logger: ^1.4.0` | 仅在调试环境启用；必须脱敏令牌、密钥和个人信息 |
| 网络图片 | `cached_network_image: ^3.4.1` | 统一处理图片缓存、占位和失败状态 |
| 分页 | `riverpod_paging_utils: ^1.0.0` | 列表分页优先使用该库，并处理刷新、重试和重复请求 |
| 可见性检测 | `visibility_detector: ^0.4.0+2` | 仅用于确需感知曝光或可见状态的组件 |
| 文件目录 | `path_provider: ^2.1.6` | 通过平台目录 API 获取路径，禁止硬编码系统路径 |
| 加密摘要 | `crypto: ^3.0.7` | 仅用于摘要、签名等非密码存储场景；不得自行设计加密协议 |
| 长列表定位 | `scrollable_positioned_list: ^0.3.8` | 需要按索引定位或跳转时优先使用 |
| UI 与图标 | `liquid_glass_widgets: ^0.21.3`、`cupertino_icons: ^1.0.8` | 遵循第 7 节 UI 规则 |
| 地图渲染与坐标 | `flutter_map: ^8.3.1`、`latlong2: ^0.9.1` | 地图统一使用 Flutter Map；经纬度模型与距离计算统一使用 LatLong2 |
| 定位与方向 | `geolocator: ^14.0.2` | 统一处理定位、权限和移动方向，并配置目标平台权限 |
| 国内坐标系转换 | `coordtransform_dart: ^1.0.4` | 必须明确数据源采用 WGS84、GCJ-02 或 BD-09，禁止混用坐标系 |
| 工程质量与图标生成 | `flutter_lints: ^6.0.0`、`flutter_test: SDK`、`flutter_launcher_icons: ^0.14.4` | 保持 lint 基线；测试和图标生成由用户手动执行 |

## 3. 架构与文件组织

- 代码按功能组织，建议采用 `features/<feature>/domain`、`features/<feature>/presentation`，具体数据源置于 `data/<source>`；仅在复杂度需要时增设层级。
- `domain` 定义实体、值对象及 Repository 抽象，不依赖网络、数据库或平台实现。
- `presentation` 仅依赖领域接口和通用 Provider，禁止直接依赖网络 API、Remote DTO、Drift、SharedPreferences 及其他具体数据源或其 Provider。
- 数据源 API、Remote DTO、拦截器、映射器、Repository 实现及装配 Provider 应聚合于相应数据源目录。
- 远端、本地数据库、键值存储及平台能力须经领域接口隔离；具体实现不得被 `domain` 或 `presentation` 直接引用。
- 具体实现仅在应用组合根通过 Provider override 等机制注入，不得向功能层泄漏。
- 文件边界取决于职责内聚性与复用范围；禁止为形式化分层创建仅含转发逻辑或简单 Provider 的文件。
- 每个 Dart 文件至多定义一个完整页面或路由 Widget。页面专用组件、Provider、Notifier 及无生成注解的状态和参数类型应内聚于页面文件；仅在跨页面/功能复用或需要代码生成时拆分。
- 含 `@freezed`、`@JsonSerializable` 等生成注解的类禁止置于 `presentation` 或其他 UI 文件，须按职责归入 `application`、`domain` 或具体数据源目录。

## 4. Widget、状态与生命周期

- 完整页面或路由 Widget 须继承 `HookConsumerWidget`；禁止使用 `StatefulWidget`、`ConsumerStatefulWidget`、`State`、`ConsumerState` 或 `setState`。
- 不依赖 Hook/Provider 的非页面展示组件优先使用 `StatelessWidget`，不得无故采用 Consumer 组件。
- 禁止以局部变量保存 `Widget`、`Widget?` 或 Widget 表达式；应在组件树使用点直接构建，复杂或复用结构提取为职责明确的独立 Widget。
- 页面局部 UI 状态使用 `flutter_hooks`；应用数据、异步请求、缓存和跨页面状态使用 Riverpod。
- Provider 只能通过 `WidgetRef.watch`、`WidgetRef.read`、`WidgetRef.listen` 或 `WidgetRef.invalidate` 访问。
- UI 须在实际依赖状态的最小 Widget 或属性范围内以 `when()` 处理 `AsyncValue`，并覆盖 `data`、`loading`、`error`。禁止以 `switch` 匹配 `AsyncData`，或通过 `value`、`valueOrNull`、`requireValue`、`isLoading`、`hasError` 将异步状态预先解包为普通/可空变量。
- 仅当最小界面区域同时依赖多个 `AsyncValue` 时嵌套 `when()`；独立区域须分别处理，禁止以局部依赖包裹整页或无关内容。
- 临时查询、参数化详情及离页即弃状态优先采用 `autoDispose`；Tab 或导航返回后需保留者可常驻。生命周期策略须依据交互语义，常驻状态须有明确依据。
- 单页 Provider 与页面同文件；实例化 Repository、数据库、API 客户端或实现类的 Provider 置于相应实现文件、实现类之前；仅多页共享状态可独立置于 `application`。
- 禁止在 `build` 中直接发起网络、数据库或平台请求；首次加载由 Provider/`useEffect` 触发，分页与用户操作由显式回调触发。
- 生命周期资源优先由 Hook 自动释放；手动订阅、监听及控制器须在 `useEffect` 清理函数或 `ref.onDispose` 中释放。
- 异步完成后，更新 Hook 状态前检查 `context.mounted`；更新 Notifier 状态前检查 `ref.mounted`。

## 5. 异步、错误与数据流

- 异步界面须覆盖加载、错误、空数据和成功状态，并提供情境化恢复路径；仅在业务确有“尚未开始”语义时建模初始状态。禁止以空集合掩盖加载/错误或静默吞错。
- 搜索、分页及详情请求须防止重复提交和陈旧响应覆盖，可采用请求序号、取消机制或等价方案。
- 错误实行分层治理：数据层保留诊断信息，领域层转换为稳定错误语义，界面层提供可理解、可恢复的反馈。
- 不得在生产日志中输出访问令牌、API 密钥、完整请求体、精确位置或其他敏感信息。
- Repository 负责协调远端、本地缓存及模型映射；Widget/Notifier 禁止解析 Remote DTO 或拼装底层存储查询。

## 6. Dart、模型与持久化

- 手写代码的类、typedef、变量、字段、常量及方法名禁止以下划线开头；生成文件及生成器强制要求的工厂声明除外。
- 手写构造函数、普通函数及方法默认采用命名参数：必填项标记 `required`，可选项提供默认值或声明可空；框架重写、运算符、第三方接口、生成器签名及回调类型约束除外。
- 优先采用不可变对象和 `const`；状态变更以 Freezed `copyWith` 或新不可变实例表达。
- Remote DTO 须严格依后端契约的字段名与类型反序列化，禁止兼容错误类型或隐式类型转换。
- Remote DTO 每个字段均须显式声明 `@JsonKey(name: '后端字段名')` 及类型匹配的 `@Default(...)`，同名亦不得省略。
- Remote DTO 禁止直接进入领域层或 UI，须显式映射为领域模型；无效数据应拒绝或报告，不得伪造默认业务值。
- Drift schema 变更须同步提升版本并实现可验证的前向迁移；删除数据库不得作为正式迁移方案。
- `shared_preferences` 不得存放密码、令牌、隐私数据、大对象或需要事务一致性的数据。

## 7. UI、可访问性与设计系统

- 采用 Cupertino-first 视觉与交互体系；除第三方接口或平台集成明确要求外，禁止引入或混用 Material 组件、主题及视觉范式。
- 液态玻璃视觉须遵循 `liquid_glass_widgets` 的初始化、组件及分层规范；页面优先使用 `GlassScaffold`，底部导航采用 `GlassTabBar` 系列。
- 玻璃效果限于导航、工具栏、浮动控制和交互控件；普通滚动内容采用清晰的非折射表面，避免玻璃层过度叠加。
- 颜色、字号、间距、圆角、阴影及动画时长优先取自主题或设计令牌，禁止重复硬编码视觉常量。
- 网络图片须配置加载占位、错误回退及合理缓存尺寸，禁止无约束加载原始大图。
- 本项目不适配无障碍；禁止使用 `Semantics`、`MergeSemantics`、`ExcludeSemantics`、`semanticLabel` 等无障碍语义 Widget、属性或 API。
- 交互控件须适配深浅色模式、安全区域及键盘遮挡，并保证充分的触控区域。
- 平台能力不可用、权限拒绝或服务关闭时，界面须降级并提供恢复路径，禁止崩溃或无限等待。

## 8. 配置、安全与交付

- API 地址、密钥、环境开关及第三方配置直接固化于源码；禁止通过环境变量、`.env`、编译参数或其他外部机制注入。
- 新增平台插件须核查 Android、iOS、macOS、Windows、Linux、Web 的支持矩阵，仅修改实际支持的目标平台配置。
- 修改后须依据变更范围提供用户手动执行的完整命令，通常涵盖格式化、代码生成、静态分析、测试及目标平台构建。
- 交付说明须包含：变更摘要、依赖变化、生成产物状态、已执行的非 Dart/Flutter 检查，以及未执行的格式化、分析、测试和构建。
- 生成代码时须逐一检查非生成 Dart 文件，移除可省略的类型、泛型及全部 `unawaited`；`.g.dart`、`.freezed.dart` 等生成文件除外。
