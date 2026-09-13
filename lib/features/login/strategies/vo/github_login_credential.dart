/// GitHub 授权完成后交给后端的换码参数，不包含客户端密钥或平台 token。
class GithubLoginCredential {
  /// 保存授权码、回调地址和对应的 PKCE 校验值。
  const GithubLoginCredential({
    required this.code,
    required this.redirectUri,
    required this.codeVerifier,
  });

  /// GitHub 返回的授权码，不能直接作为应用登录 token 使用。
  final String code;
  /// 发起授权时使用的回调地址，换码时需保持一致。
  final String redirectUri;
  /// SDK 为本次授权生成的 PKCE 原始校验值，供后端换码使用。
  final String codeVerifier;
}
