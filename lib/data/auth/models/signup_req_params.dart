import 'dart:convert';

class SignupReqParams {
  final String email;
  final String password;

  SignupReqParams({required this.email, required this.password});

  SignupReqParams copyWith({String? email, String? password}) {
    return SignupReqParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() => {'email': email, 'password': password};

  factory SignupReqParams.fromMap(Map<String, dynamic> map) => SignupReqParams(
    email: map['email'] ?? '',
    password: map['password'] ?? '',
  );

  String toJson() => json.encode(toMap());

  factory SignupReqParams.fromJson(String source) =>
      SignupReqParams.fromMap(json.decode(source));
}
