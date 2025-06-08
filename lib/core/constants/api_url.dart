class ApiUrl {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:8080/',
  );

  static const signup = 'api/v1/auth/signup';
  static const signin = 'api/v1/auth/signin';
}
