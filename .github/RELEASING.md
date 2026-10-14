# 自动版本发布

主分支为 `master`。使用 Release Please 的 Dart 策略，初始版本基线为 `1.0.0`，应用当前版本为 `1.0.0+1`。

## 提交与发布

1. 将功能或修复合入 `master`，提交信息遵循 Conventional Commits。使用 squash merge 时，PR 标题应遵循相同格式。
2. 工作流自动创建或更新版本 PR，修改 `pubspec.yaml`、`CHANGELOG.md` 和 `.release-please-manifest.json`。
3. 审查并合并版本 PR。工作流自动创建 `vX.Y.Z` tag 和 GitHub Release，随后直接调用构建工作流，构建该 tag 的 Android arm64 APK 和未签名 iOS IPA，并上传到 Release。

版本规则：`fix: 修复阅读进度` 增加 patch，`feat: 新增阅读模式` 增加 minor，`feat!: 调整不兼容接口` 或提交正文中的 `BREAKING CHANGE:` 增加 major。普通 `docs:`、`chore:` 提交不会单独触发新版本。

Dart 策略同时递增 `+` 后的构建号，例如仅包含修复时，`1.0.0+1` 更新为 `1.0.1+2`。新增提交会更新已有版本 PR，不会为每次提交单独创建一个版本。

版本 PR 需要人工合并；工作流不自动合并 PR。GitHub Release 在安装包构建前创建，构建失败时可能暂时没有附件。

## 仓库设置

在 Settings → Actions → General → Workflow permissions 中启用 **Allow GitHub Actions to create and approve pull requests**，并确保组织策略允许工作流声明的写权限。

使用内置 `GITHUB_TOKEN`，无需新增 PAT。该令牌创建的 tag 不会触发另一次 tag 工作流，因此版本工作流直接调用可复用构建工作流。

Sentry 继续沿用已有的 `SENTRY_DSN` Actions secret。此流程不包含应用商店发布或 Shorebird 补丁发布。

## 构建失败恢复

在 Actions 中手动运行 **Build Android and iOS**，填写已有 tag（例如 `v1.0.1`）到 `release_tag`，即可重新构建并上传附件；同名附件会替换，原发布说明保留。留空则仅构建当前选中 ref，选中 tag 时仍会发布附件。

仍支持手动推送 tag 触发构建；须先确保该 tag 对应的 `pubspec.yaml` 版本正确。

## 本地手动检查

在项目根目录执行：

```bash
dart format --output=none --set-exit-if-changed lib
flutter analyze
flutter test
flutter build apk --release --target-platform android-arm64
flutter build ios --release --no-codesign
```

本次仅修改发布配置与文档，不需要重新生成 Dart 代码。
