# 项目协作约束

以下规则适用于本仓库及其所有子目录，后续 Codex 会话必须遵守。

## 命令执行

- 禁止 Codex 执行任何 `dart` 或 `flutter` 命令，包括通过脚本、IDE、包装器或其他命令间接调用。
- 需要执行 `flutter pub get`、代码生成、格式化、静态分析、测试、构建或运行时，只能把完整命令输出给用户，由用户手动执行。
- Codex 可以使用不调用 Dart/Flutter 的只读命令检查源文件，并可使用 `apply_patch` 修改代码。
- 未实际运行的分析、测试或构建结果不得声称已经通过；交付时必须明确说明未运行。

## Flutter 页面规范

- 每个承担完整页面或路由职责的 Dart 文件只能定义一个页面 Widget；不同页面必须拆分到不同 Dart 文件。
- 页面专属且不会复用的组件可以保留在对应页面文件中；被多个页面或功能复用的组件必须拆分到独立 Dart 文件。
- 仅被单个页面使用的 Provider 及其专属状态类型、参数类型和 Notifier 应放在对应页面的 Dart 文件中。
- 被多个页面或功能复用的 Provider 及其共享状态类型、参数类型和 Notifier 必须拆分到独立 Dart 文件。
- 手写 Dart 代码中的类名、typedef 名、变量名、字段名、常量名和方法名均不得以下划线开头。
- 上述下划线命名限制不适用于 `.g.dart`、`.freezed.dart` 等生成文件，也不适用于 Freezed、Retrofit 等代码生成器在手写源码中强制要求的生成类工厂声明。
- 所有承担完整页面或路由职责的 Widget 必须继承 `HookConsumerWidget`。
- 页面不得使用 `StatefulWidget`、`ConsumerStatefulWidget`、`State`、`ConsumerState` 或 `setState`。
- 页面局部 UI 状态使用 `flutter_hooks`，例如 `useState`、`useEffect`、`useMemoized`、`useTextEditingController`、`useFocusNode` 和 `useScrollController`。
- 应用数据、异步请求、缓存及跨页面共享状态使用 Riverpod Provider，通过 `WidgetRef.watch/read/invalidate` 访问。
- 生命周期资源优先交给对应 Hook 自动释放；自定义监听必须在 `useEffect` 的清理函数中解除。
- 不要为了形式统一把纯展示型叶子组件改成 Consumer。无需 Hook 或 Provider 的非页面组件应优先使用 `StatelessWidget`。
- 异步操作完成后更新 Hook 状态前必须确认 Widget 仍然挂载，避免页面销毁后的状态更新。
- 避免在 `build` 中直接发起网络请求；首次加载放在 Provider 或 `useEffect` 中，分页和用户操作由明确回调触发。

## UI 架构

- 液态玻璃界面遵循 `liquid_glass_widgets` 的组件和分层规范。
- 玻璃效果主要用于导航、工具栏、浮动控制和交互控件；普通滚动内容卡片保持清晰、非折射表面。
- 页面优先使用 `GlassScaffold`，底部导航使用库提供的 `GlassTabBar` 系列组件。
