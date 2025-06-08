import 'dart:convert';

class SigninReqParams {
  final String email;
  final String password;

  SigninReqParams({required this.email, required this.password});

  SigninReqParams copyWith({String? email, String? password}) {
    return SigninReqParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() => {'email': email, 'password': password};

  factory SigninReqParams.fromMap(Map<String, dynamic> map) => SigninReqParams(
    email: map['email'] ?? '',
    password: map['password'] ?? '',
  );

  String toJson() => json.encode(toMap());

  factory SigninReqParams.fromJson(String source) =>
      SigninReqParams.fromMap(json.decode(source));
}
