class UserLoginModel {
  final String? token;
  String? role;
  UserLoginModel({
    required this.token,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'role': role,
    };
  }

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      token: map['token'],
      role: map['role'],
    );
  }
}
