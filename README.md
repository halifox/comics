<div align="center">

  <img src="assets/icon/app_icon.png" alt="Comics 应用图标" width="128" />

# Comics

一个第三方拷贝漫画阅读客户端，支持漫画发现、搜索、书架和多模式阅读。

[![Built with Flutter](https://img.shields.io/badge/built%20with-Flutter-02569B)](#从源码运行与构建)
[![Android arm64](https://img.shields.io/badge/Android-arm64-3DDC84)](#安装)
[![iOS unsigned IPA](https://img.shields.io/badge/iOS-unsigned%20IPA-555555)](#安装)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-lightgrey)](LICENSE)

[功能](#功能概览) · [预览](#界面预览) · [安装](#安装) · [构建](#从源码运行与构建) · [数据与隐私](#数据与隐私)

</div>

---

> [!IMPORTANT]
> 本项目为非官方客户端，仅供学习与技术交流。项目与拷贝漫画及其运营方无隶属、合作或授权关系；内容版权归原作者及相关权利人所有。

## 功能概览

- 浏览首页推荐、热门更新、全新上架与完结作品；
- 查看日榜、周榜和月榜，按分类筛选或通过关键词搜索漫画；
- 将作品加入本地书架，查看阅读历史和搜索历史；
- 查看漫画详情和章节分组，记录阅读章节与页码，继续上次阅读；
- 支持条漫、翻页和日漫三种阅读模式；
- 切换浅色、深灰和纯黑阅读背景；
- 使用 Cupertino 风格界面，支持浅色与深色外观，并在导航和交互控件中使用液态玻璃效果。

## 界面预览

<div align="center">
  <img src="screenshots/screenshot_1.webp" width="24%" />
  <img src="screenshots/screenshot_2.webp" width="24%" />
  <img src="screenshots/screenshot_11.webp" width="24%" />
  <img src="screenshots/screenshot_12.webp" width="24%" />
  <img src="screenshots/screenshot_13.webp" width="24%" />
  <img src="screenshots/screenshot_14.webp" width="24%" />
  <img src="screenshots/screenshot_16.webp" width="24%" />
  <img src="screenshots/screenshot_15.webp" width="24%" />
</div>

## 安装

### Android

从 [GitHub Releases](https://github.com/halifox/comics/releases/latest) 下载 `.apk` 文件，打开后按系统提示安装。目前提供 arm64 安装包。

### iOS

从 [GitHub Releases](https://github.com/halifox/comics/releases/latest) 下载未签名的 `.ipa` 文件，使用 SideStore 安装。

首次使用请按 [SideStore 官方安装教程](https://docs.sidestore.io/docs/installation/install) 完成配置，再在 SideStore 的 **My Apps → +** 中选择下载的 IPA。免费 Apple 账号签名通常需每 7 天刷新一次。

版本变化见 [CHANGELOG.md](CHANGELOG.md)。

## 使用说明与限制

- 漫画列表、详情、章节和图片来自拷贝漫画内容服务，浏览与阅读需要可访问该服务的网络连接。
- 第三方服务的接口、线路或内容变化可能影响加载。遇到失败时，可检查网络后使用页面提供的重试或刷新操作。
- 书架、阅读进度、搜索历史和阅读设置保存在本机，当前不提供账号登录或跨设备同步。
- 图片缓存用于减少重复加载，当前不提供整章下载或离线书库；缓存不等同于可完整离线阅读。
- 当前发布流程面向 Android arm64 和 iOS。仓库中的其他平台目录不代表已有对应发行包或经过完整验证。

## 从源码运行与构建

### 环境要求

- Flutter SDK（包含 Dart 3.12.2 或兼容的 3.x 版本，以 `pubspec.yaml` 为准）
- 对应目标平台的 Flutter 开发环境
- Android 构建需要 Android SDK 和 Java 17；iOS 构建需要 macOS、Xcode 与对应的签名配置
- 可访问内容服务的网络连接

### 获取并运行

```bash
# 克隆仓库
git clone https://github.com/halifox/comics.git
cd comics

# 安装依赖
flutter pub get

# 生成 Retrofit、Freezed、JSON 与 Drift 相关代码
dart run build_runner build --delete-conflicting-outputs

# 运行应用
flutter run
```

仓库已经包含当前生成的代码；当数据模型、API 或数据库定义发生变化时，需要重新执行代码生成。

### 构建安装包

在仓库根目录运行：

```bash
# Android arm64 Release APK：需先配置 android/key.properties 和签名密钥
flutter build apk --release --target-platform android-arm64

# iOS 未签名应用：需在 macOS 上运行，产物不能直接安装
flutter build ios --release --no-codesign

# iOS 签名 IPA：需先在 Xcode 中配置开发团队、证书与描述文件
flutter build ipa --release
```

Android APK 输出到 `build/app/outputs/flutter-apk/`；iOS 未签名应用输出到 `build/ios/iphoneos/`，签名 IPA 输出到 `build/ios/ipa/`。仓库的发布工作流会将未签名 iOS 应用另行打包为 IPA。

### 技术栈

- **UI 框架** — Flutter / liquid_glass_widgets
- **状态管理** — Riverpod / Flutter Hooks
- **网络请求** — Dio / Retrofit
- **数据模型** — Freezed / json_serializable
- **本地存储** — Drift / Shared Preferences
- **图片加载** — cached_network_image
- **分页加载** — riverpod_paging_utils

## 数据与隐私

### 本地数据

书架收藏、漫画基本信息、章节阅读进度和搜索历史存储在应用私有目录中的 SQLite 数据库；阅读模式与背景设置通过 SharedPreferences 保存。网络图片由图片缓存组件管理。

可在阅读历史页面清空阅读历史，在搜索历史页面删除单条搜索记录。清空阅读历史不会同时删除书架收藏、搜索历史或所有章节进度。Android 可通过系统应用设置清除应用存储，删除本地数据库、设置和缓存；此操作不可撤销。

### 网络请求与诊断

加载漫画和图片时，应用会向内容服务及图片地址发送网络请求；搜索关键词、漫画标识和章节标识会随相应请求发送。

项目已接入 Sentry 错误与性能诊断，发布工作流通过构建配置传入 Sentry DSN。配置有效时，可能发送异常、堆栈、请求诊断信息和设备信息；当前配置启用了默认个人信息收集、性能追踪，以及错误会话和部分普通会话的回放采样。因此，本项目不作“无遥测”或“所有数据仅保留在本机”的承诺。

调试构建还会输出网络日志，并在应用缓存目录的 `copy_manga_records/` 下记录请求与响应，可能包含请求头、参数和响应正文。提交 Issue 或分享日志前，请删除个人信息与其他敏感内容。

## 许可证与第三方内容

本项目源代码遵循 [GPL-3.0 License](LICENSE)。第三方依赖遵循各自的许可证，依赖列表见 [pubspec.yaml](pubspec.yaml)。

漫画内容的版权归原作者及相关权利人所有，不适用本项目的代码许可证。拷贝漫画的名称及相关品牌权利归其相应权利人所有，本项目的许可证声明不构成内容、商标或品牌授权。

## 参与贡献

欢迎提交问题、改进建议和 Pull Request。提交代码前，请阅读 [AGENTS.md](AGENTS.md) 中的协作约束。

反馈问题时，请说明应用版本、平台、复现步骤和错误现象；附带截图或日志前请先脱敏。
