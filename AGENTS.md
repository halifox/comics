# Flutter 项目协作规范

本文件是可复用于 Flutter 新项目的工程基线，适用于所在目录及全部子目录。项目内更深层级的 `AGENTS.md` 可补充业务规则；冲突时以更深层级规则为准。

## 1. 执行边界

- Codex 仅可使用不调用 Dart 或 Flutter 的只读命令检查文件，并通过 `apply_patch` 修改代码；凡直接或间接调用 `dart`、`flutter` 的操作（含脚本、IDE、任务系统及包装器），均不得执行，只能提供完整命令供用户手动运行。
- 交付时必须明确说明格式化、静态分析、测试及构建均未执行，不得声称其已通过。
- Codex 可直接修改 `pubspec.yaml`；使用第 2.2 节通用基础栈中的依赖无需用户确认，引入、移除或升级表外依赖则必须先说明用途、现有替代方案及影响范围，并取得用户明确授权。
- 不得手动修改 `.g.dart`、`.freezed.dart` 等生成文件；源文件变化后，仅提供完整的代码生成命令。

## 2. 技术选型

### 2.1 选型原则

- 以当前项目 `pubspec.yaml` 为依赖和版本的事实来源；第 2.2 节同时标注基线版本，调整依赖时必须同步更新两处，且冲突时以 `pubspec.yaml` 为准。
- 项目默认采用 `hooks_riverpod` + `flutter_hooks` 架构；Provider 必须手写，禁止 Riverpod 注解及其代码生成。
- 优先使用通用基础栈及已有依赖简化开发、减少样板代码；已有库能够满足需求时，不得引入同类库或重复实现其核心能力。
- 通用基础栈中的依赖按项目实际需求安装和启用，不要求新项目一次性安装全部依赖，也不得为未使用的能力预装依赖；表外业务专项依赖仅在确有需求且取得用户确认后引入。

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

- 按功能组织代码；建议使用 `features/<feature>/domain`、`features/<feature>/presentation`，具体数据源置于 `data/<source>`。只有实际复杂度需要时才增加层级。
- `domain` 定义实体、值对象及 Repository 抽象，不得依赖具体网络、数据库或平台实现。
- `presentation` 只能依赖领域接口和通用 Provider，不得直接依赖网络 API、Remote DTO、Drift 数据库、SharedPreferences 或其他具体数据源及其 Provider。
- 特定数据源的 API、Remote DTO、拦截器、映射器、Repository 实现及装配 Provider 应集中在该数据源目录。
- 远端、本地数据库、键值存储及平台能力必须通过领域接口隔离；具体实现仅负责实现接口，不得被 `presentation` 或领域层直接引用。
- 具体实现仅在应用组合入口通过 Provider override 等方式注入；不得把实现细节泄漏到功能层。
- 文件边界由职责完整性和复用范围决定，不得为形式化分层创建只含转发代码或简单 Provider 的文件。
- 每个 Dart 文件至多定义一个完整页面或路由 Widget；页面专用组件、Provider、Notifier 及不使用生成注解的状态和参数类型保留在页面文件中，跨页面、跨功能复用或状态类型需要代码生成时再拆分。
- 使用 `@freezed`、`@JsonSerializable` 或其他代码生成注解的类不得定义在 `presentation`、页面或其他 UI 层文件中，必须按照职责放置到 `application`、`domain` 或具体数据源目录。

## 4. Widget、状态与生命周期

- 完整页面或路由 Widget 必须继承 `HookConsumerWidget`；不得使用 `StatefulWidget`、`ConsumerStatefulWidget`、`State`、`ConsumerState` 或 `setState`。
- 不依赖 Hook 或 Provider 的非页面展示组件优先使用 `StatelessWidget`，不得无故使用 Consumer 类组件。
- 禁止声明局部变量保存 `Widget`、`Widget?` 或返回 Widget 的表达式；Widget 必须直接构建在 Widget 树的实际使用位置，结构复杂或需要复用时提取为职责明确的独立 Widget。
- 页面局部 UI 状态使用 `flutter_hooks`；应用数据、异步请求、缓存和跨页面状态使用 Riverpod。
- Provider 只能通过 `WidgetRef.watch`、`WidgetRef.read`、`WidgetRef.listen` 或 `WidgetRef.invalidate` 访问。
- UI 层处理 `AsyncValue` 必须在真正依赖该状态的最小 Widget 或属性范围内使用 `when()`，并按场景明确处理 `data`、`loading` 和 `error`；不得通过 `switch` 匹配 `AsyncData`，也不得使用 `value`、`valueOrNull`、`requireValue`、`isLoading` 或 `hasError` 先将异步状态解包为普通或可空局部变量再构建界面。
- 多个 `AsyncValue` 仅可在确实同时依赖它们的最小界面区域嵌套 `when()`；相互独立的界面区域必须分别处理各自状态，不得因局部依赖而用异步分支包裹整个页面或其他无关内容。
- 临时查询、参数化详情和离开页面即可丢弃的状态优先使用 `autoDispose`；Tab 页面、导航栈返回后需要保留的状态可以常驻。Provider 生命周期由实际交互需求决定，不使用一刀切规则；常驻状态应具有明确的保留依据。
- 单页面 Provider 与页面同文件；实例化 Repository、数据库、API 客户端或实现类的 Provider 置于对应实现文件且位于实现类之前；仅多页面共享的应用状态可置于独立 `application` 文件。
- 不得在 `build` 中直接发起网络、数据库或平台请求。首次加载由 Provider 或 `useEffect` 触发，分页和用户操作由明确回调触发。
- 生命周期资源优先由 Hook 自动释放；手动订阅、监听和控制器必须在 `useEffect` 清理函数或 `ref.onDispose` 中释放。
- 异步完成后，更新 Hook 状态前检查 `context.mounted`；更新 Notifier 状态前检查 `ref.mounted`。

## 5. 异步、错误与数据流

- 异步界面必须覆盖实际可能出现的加载、错误、空数据和成功状态，并提供与场景匹配的恢复路径；只有业务上存在“尚未开始”状态时才单独建模初始状态。不得以空集合掩盖加载或错误，也不得静默吞错。
- 搜索、分页和详情请求必须防止重复提交及旧响应覆盖新状态；可采用请求序号、取消请求或等价机制。
- 错误分层处理：数据层保留可诊断信息，领域层转换为稳定错误语义，界面层展示用户可理解且可恢复的提示。
- 不得在生产日志中输出访问令牌、API 密钥、完整请求体、精确位置或其他敏感信息。
- Repository 负责协调远端、本地缓存及模型映射；Widget 和 Notifier 不得解析 Remote DTO 或拼接底层存储查询。

## 6. Dart、模型与持久化

- 手写代码中的类、typedef、变量、字段、常量及方法名不得以下划线开头。生成文件及生成器强制要求的工厂声明除外。
- 手写构造函数、普通函数及方法默认使用命名参数：必填参数标记 `required`，可选参数提供默认值或声明为可空。框架重写、运算符、第三方接口、生成器签名及受回调类型约束的声明除外。
- 优先使用不可变对象和 `const`；状态变更通过 Freezed 的 `copyWith` 或新的不可变实例表达。
- Remote DTO 必须严格按照后端契约的字段名与字段类型反序列化，不得兼容后端错误类型或加入隐式类型转换。
- Remote DTO 的每个字段必须显式声明 `@JsonKey(name: '后端字段名')`，并声明与字段类型匹配的 `@Default(...)`；即使名称相同也不得省略。
- Remote DTO 不得直接进入领域层或 UI；必须通过显式映射转换为领域模型。无效数据应明确拒绝或报告，不得悄悄伪造默认业务值。
- Drift schema 变化时必须同步提升 schema 版本并实现可验证的前向迁移；删除数据库不得作为正式迁移方案。
- `shared_preferences` 不得存放密码、令牌、隐私数据、大对象或需要事务一致性的数据。

## 7. UI、可访问性与设计系统

- 项目采用 Cupertino-first 视觉与交互体系；除第三方组件接口或平台集成明确要求外，不得引入或混用 Material 组件、主题及视觉模式。
- 使用液态玻璃视觉时必须遵循 `liquid_glass_widgets` 的初始化、组件及分层规范；页面优先使用 `GlassScaffold`，底部导航使用 `GlassTabBar` 系列组件。
- 玻璃效果主要用于导航、工具栏、浮动控制及交互控件；普通滚动内容采用清晰、非折射表面，避免过度叠加玻璃层。
- 颜色、字号、间距、圆角、阴影和动画时长优先取自主题或设计令牌，不得重复硬编码视觉常量。
- 网络图片必须提供加载占位、错误回退及合适的缓存尺寸；不得无约束加载原始大图。
- 本项目不考虑无障碍适配；禁止使用 `Semantics`、`MergeSemantics`、`ExcludeSemantics`、`semanticLabel` 及其他专用于无障碍语义的 Widget、属性或 API。
- 交互控件必须支持深浅色模式、安全区域和键盘遮挡，并提供足够的可操作区域。
- 平台能力不可用、权限被拒绝或服务关闭时，界面必须降级并给出恢复路径，不得崩溃或无限等待。

## 8. 配置、安全与交付

- API 地址、密钥、环境开关及第三方配置直接硬编码在源码中；禁止使用环境变量、`.env`、编译参数或其他外部注入方式。
- 新增平台插件时必须同步检查 Android、iOS、macOS、Windows、Linux 和 Web 的支持范围；只修改实际支持和目标平台的配置。
- 修改完成后，Codex 应基于变更范围向用户提供需要手动执行的完整命令，通常包括格式化、代码生成、静态分析、测试和目标平台构建。
- 交付说明必须包含：变更摘要、依赖变化、生成文件状态、已执行的非 Dart/Flutter 检查，以及未执行的格式化、分析、测试和构建。
