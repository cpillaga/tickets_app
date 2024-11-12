class TokenProvider {
  static final TokenProvider tp = TokenProvider.token_provider();

  factory TokenProvider() {
    return tp;
  }

  TokenProvider.token_provider();

  String token = '';
  String idUser = '';

  String setToken(String tokenResponse) {
    token = tokenResponse;
    return tokenResponse;
  }

  String setIdUser(String idUserResponse) {
    idUser = idUserResponse;
    return idUserResponse;
  }

  String getToken() {
    return token;
  }

  String getIdUser() {
    return idUser;
  }
}
