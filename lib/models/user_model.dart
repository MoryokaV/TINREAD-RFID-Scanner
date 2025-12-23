class User {
  final String username;
  final String password;
  final String serverURL;

  User({
    required this.username,
    required this.password,
    required this.serverURL,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      serverURL: json['serverURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'serverURL': serverURL,
    };
  }
}
