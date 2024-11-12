class UserProvider {
  static final UserProvider up = UserProvider.userProvider();

  factory UserProvider() {
    return up;
  }

  UserProvider.userProvider();

  Map<dynamic, dynamic>? user = {};

  Map<dynamic, dynamic>? setUser(Map<dynamic, dynamic>? userResponse) {
    user = userResponse;
    return user;
  }

  Map<dynamic, dynamic>? getUser() {
    return user;
  }
}
