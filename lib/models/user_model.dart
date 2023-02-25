class UserModel {
  final String? id;
  final String username;
  final String email;
  final String phone;
  final String password;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  toJson() {
    return {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    };
  }
}
