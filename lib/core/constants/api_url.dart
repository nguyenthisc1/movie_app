class ApiUrl {
  // static const String baseUrl = String.fromEnvironment(
  //   'BASE_URL',
  //   defaultValue: 'http://localhost:8080/',
  // );

  static const String baseUrl =
      'https://backend-netflix-production-c54a.up.railway.app/';

  static const apiV = 'api/v1';

  // {
  // 	"label": "Flutter-Launch-All",
  // 	"dependsOn": ["Flutter-Launch-iOS", "Flutter-Launch-Android", "Flutter-Launch-Web"]
  // },
  // {
  // 	"label": "Flutter-Launch-iOS",
  // 	"type": "shell",
  // 	"command": "flutter run -d 'iPhone 15 Pro Max' --dart-define=BASE_URL=http://192.168.1.8:8080/"
  // },
  // {
  // 	"label": "Flutter-Launch-Android",
  // 	"type": "shell",
  // 	"command": "flutter run -d 'emulator-5554' --dart-define=BASE_URL=http://10.0.2.2:8080/"
  // },
  // {
  // 	"label": "Flutter-Launch-Web",
  // 	"type": "shell",
  // 	"command": "flutter run -d 'Chrome' --dart-define=BASE_URL=http://localhost:8080/"
  // }

  // Auth
  static const signup = '$apiV/auth/signup';
  static const signin = '$apiV/auth/signin';

  // Movies
  static const movieUrl = '$apiV/movie';
  static const moviesTrending = '$movieUrl/trending';
  static const moviesNowPlaying = '$movieUrl/nowplaying';

  // TV Shows
  static const tvUrl = '$apiV/tv';
  static const tvTrending = '$tvUrl/trending';
  static const tvPopular = '$tvUrl/popular';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
  static const search = '${apiV}search/';
}
