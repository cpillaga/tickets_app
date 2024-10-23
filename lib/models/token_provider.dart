class TokenProvider {
  static final TokenProvider tp = TokenProvider.token_provider();

  factory TokenProvider() {
    return tp;
  }

  TokenProvider.token_provider();

  String token = '';

  String setToken(String tokenResponse) {
    token = tokenResponse;
    return tokenResponse;
  }

  String getToken() {
    return token;
  }
}
