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

## Android 正式签名

Comics 使用独立的 RSA 4096 位签名密钥。证书主体仅为 `CN=Android Release, OU=Mobile, O=Independent`，不包含个人姓名、邮箱或地理位置；证书和指纹会随 APK 公开。

仓库 Actions Secrets 包含 `ANDROID_KEYSTORE_BASE64`、`ANDROID_KEYSTORE_PASSWORD`、`ANDROID_KEY_PASSWORD`、`ANDROID_KEY_ALIAS`。CI 将密钥临时还原到 runner 临时目录，生成已被 Git 忽略的 `android/key.properties`。构建后校验 APK 证书是否匹配这份密钥，随后清理临时签名文件。签名配置缺失时不会回退到 debug 签名。

本机密钥及密码备份位于 `~/.android-signing/comics/`，仅当前用户可访问；本地 `android/key.properties` 已配置。请将整个备份目录另行保存到可靠的私密备份位置。GitHub Secrets 无法下载还原，不能作为唯一备份。

同一应用的所有后续版本使用同一份签名密钥。不同应用建议各自使用独立密钥，Flutter 与原生 Android 的签名机制相同。同一应用在多个仓库构建时，可以将同一组 Secrets 配置到相关仓库；组织仓库也可使用限定仓库范围的组织 Secrets。

`v1.1.0` 使用旧的 CI debug 签名，切换正式签名后的 APK 无法直接覆盖它；用户需要卸载旧版后重新安装，卸载可能删除本地数据。之后保持正式密钥不变即可持续覆盖升级。此 JKS 用于 Android，不适用于 iOS 签名。

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
