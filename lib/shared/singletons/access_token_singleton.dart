class AccessTokenSingleTon {
  static AccessTokenSingleTon? _instance;

  AccessTokenSingleTon._();

  static AccessTokenSingleTon get getInstance =>
      _instance ??= AccessTokenSingleTon._();

  String accessToken = "";

  setAccessToken(String accessToken) {
    this.accessToken = accessToken;
  }

  String getAccessToken() {
    return accessToken;
  }
}
