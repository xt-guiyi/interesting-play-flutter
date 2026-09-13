# 登录接入说明

## 结构

```text
LoginPage -> LoginViewModel ---------+
                                    +-> LoginStrategyFactory
SmsLoginPage -> SmsLoginViewModel ---+           |
                                  Google / GitHub / SMS strategy
                                               |
                                      Repository -> Service
```

- `model/`：Repository 和 Service；`vo/request/` 放以 `Request` 结尾的接口请求类，`vo/response/` 放以 `Response` 结尾的接口响应类。
- `strategies/`：登录命令、渠道类型和策略工厂；`impl/` 放各渠道策略实现，包含公开配置、SDK 授权和后端登录调用，返回统一 `LoginResponse`。
- `viewmodel/`：各页面独立负责登录提交、防重复点击、取消和错误处理，调用 Repository 保存结果后更新 `AuthSession`。Google、GitHub 流程在 `LoginViewModel`；短信登录、发送验证码和 60 秒倒计时在 `SmsLoginViewModel`。
- `view/`：协议勾选、Toast、焦点和导航。未同意协议不会启动授权；底部弹层关闭后才打开系统授权页。

用户取消不视为错误。离开页面或 Provider 失效会取消该次操作；迟到的结果不提交。各页面在请求期间保持忙碌状态，禁止重复提交。

游客浏览、本地退出和 HTTP 401 处理不变；手机号一键登录仍是占位入口。这里只接入 iOS、Android，不接入 Firebase。

## 公开参数

公开参数直接定义在对应策略类中，不包含客户端密钥。Google Web、iOS 和 GitHub Client ID 已配置默认值，无需额外传入启动参数，也可通过 `dart-define` 覆盖。GitHub 复用现有网页端对应的 GitHub App，控制台仍需登记移动端回调地址。

- `lib/features/login/strategies/impl/google_login_strategy.dart`：Google Web、iOS Client ID。
- `lib/features/login/strategies/impl/github_login_strategy.dart`：GitHub Client ID、回调地址和授权端点。

| 参数 | 填写内容 |
| --- | --- |
| `GOOGLE_SERVER_CLIENT_ID` | Google Cloud 的 Web OAuth Client ID，须匹配后端验证的受众 |
| `GOOGLE_IOS_CLIENT_ID` | Google Cloud 的 iOS OAuth Client ID，仅 iOS 必填 |
| `GITHUB_CLIENT_ID` | GitHub App 的 Client ID，不是 App ID，也不是 Client Secret |

切换环境时可按以下示例覆盖参数，示例值不能直接用于登录；使用当前客户端配置时省略 `GOOGLE_*` 和 `GITHUB_CLIENT_ID` 参数：

```bash
flutter run \
  --dart-define=APP_API_BASE_URL=http://192.168.2.216:8080 \
  --dart-define=GOOGLE_SERVER_CLIENT_ID=YOUR_WEB_ID.apps.googleusercontent.com \
  --dart-define=GOOGLE_IOS_CLIENT_ID=YOUR_IOS_ID.apps.googleusercontent.com \
  --dart-define=GITHUB_CLIENT_ID=YOUR_GITHUB_APP_CLIENT_ID
```

缺少某个渠道的配置时会提示，不会发起该渠道的登录请求；不影响短信登录。正式环境应使用 HTTPS。所有 Client Secret 仅留在后端，不放入 Dart、资源文件或原生配置。

## Google

### 两个平台共有

1. 在 Google Cloud 配置 OAuth 同意屏幕；应用仍处于测试状态时添加测试用户。
2. 创建 Web OAuth Client ID，填入 `GOOGLE_SERVER_CLIENT_ID`，后端 `USER_GOOGLE_CLIENT_ID` 使用同一个值。
3. 客户端取得 `idToken` 后发送到 `/api/user/auth/google`。后端返回的应用 token 才用于业务接口，不使用 Google token 作为应用登录态。

### iOS

1. 注册 iOS OAuth 客户端，Bundle ID 为 `com.xtguiyi.featurecollection`。
2. 将该客户端 ID 填入 `GOOGLE_IOS_CLIENT_ID`。
3. `ios/Runner/Info.plist` 的 `CFBundleURLSchemes` 已配置当前 iOS 客户端对应的回调 scheme。更换 iOS Client ID 时，需要同步替换为 Google Cloud 对应客户端的 `iOS URL scheme`。例如 `123-abc.apps.googleusercontent.com` 对应 `com.googleusercontent.apps.123-abc`。保留旁边 GitHub 使用的 `com.xtguiyi.featurecollection`。
4. 按官方支持的 Dart 配置方式，`clientId` 和 `serverClientId` 仍通过 Dart 初始化传入；回调 scheme 直接写在 `Info.plist` 中，不再单独创建配置文件。修改后需要重新编译，热重载不会更新原生配置。

### Android

1. 注册 Android OAuth 客户端，包名为 `com.xtguiyi.featurecollection`。
2. 配置实际签名证书的 SHA-1；调试、正式签名和 Google Play App Signing 可能不同，应分别登记。
3. App 仍传 Web 类型的 `GOOGLE_SERVER_CLIENT_ID`，不要把 Android Client ID 填进这个参数。

本方案直接配置 `serverClientId`，不要求引入 Firebase 或 `google-services.json`。

## GitHub

1. 在 GitHub App 控制台登记固定回调：`com.xtguiyi.featurecollection://oauth/github`。
2. 将该 App 的 Client ID 填入 `GITHUB_CLIENT_ID`，后端配置相同 Client ID 和对应 Client Secret。
3. GitHub App 的用户权限需包含读取邮箱，以便后端读取用户的已验证邮箱。权限在 GitHub App 控制台配置，不使用 OAuth App 的 scope 列表。
4. iOS URL scheme 和 Android AppAuth 回调 scheme 已注册。Android 按插件文档移除了阻碍授权返回的空 `taskAffinity`。

### PKCE 参数要求

`flutter_appauth.authorize()` 只取得授权结果，不在客户端交换平台 token。它自动生成 `state`、`codeVerifier` 并发送 S256 `code_challenge`。

GitHub 的规则是：发起授权时发送了 `code_challenge`，换取 token 时就必须发送对应的 `code_verifier`。因此，当前 SDK 流程不能只在换码阶段省略该字段。

App 侧的请求结构：

```json
{
  "code": "authorization-code",
  "redirectUri": "com.xtguiyi.featurecollection://oauth/github",
  "codeVerifier": "per-authorization-pkce-verifier"
}
```

后端已补充接收、校验格式并转发 `codeVerifier`，将该值作为表单字段 `code_verifier` 交给 GitHub；旧 Web 客户端可不传这个新增字段。这次后端只做这一处适配，没有修改 Google 验证方式、账号绑定、邮箱选择或回调白名单逻辑。上线前需同时更新后端，实际授权仍需填写平台配置后验证。

## 接口与超时

| 用途 | 接口 | 参数 |
| --- | --- | --- |
| 发送短信 | `/api/user/auth/sms-code` | `phone`、`scene: LOGIN` |
| 短信登录 | `/api/user/auth/login` | `loginType: SMS_CODE`、`account`、`code` |
| Google 登录 | `/api/user/auth/google` | `idToken` |
| GitHub 登录 | `/api/user/auth/github` | `code`、`redirectUri`、`codeVerifier` |

只有 Google、GitHub 登录请求使用 30 秒接收超时，不更改全局网络超时。渠道登录错误交给当前页面提示，避免与全局 Toast 重复。应用 token 继续通过 `Authorization: Bearer <token>` 发送。

## 生成与验证边界

修改依赖或注解后执行完整生成，不使用局部 build filter：

```bash
flutter pub get
dart run build_runner build
dart analyze lib
```

依赖和原生回调变更需要完整重启 App。当前只做代码生成和静态检查，不运行测试、不发送短信、不替用户完成第三方授权。

填写平台参数并完成后端必要适配后，由用户验证三种登录成功、取消授权、协议未同意、配置缺失、验证码错误、网络失败、重复点击、退出后再次登录。

## 参考

- [Google Sign-In 插件](https://pub.dev/packages/google_sign_in)
- [Google Android 配置](https://pub.dev/packages/google_sign_in_android)
- [Google iOS 配置](https://pub.dev/packages/google_sign_in_ios)
- [Flutter AppAuth](https://pub.dev/packages/flutter_appauth)
- [GitHub App 用户授权与 PKCE](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-a-user-access-token-for-a-github-app)
