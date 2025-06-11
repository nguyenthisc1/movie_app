class ApiUrl {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:8080/',
  );

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
  static const signup = 'api/v1/auth/signup';
  static const signin = 'api/v1/auth/signin';

  // Movies
  static const moviesTrending = 'api/v1/movie/trending';
  static const moviesNowPlaying = 'api/v1/movie/nowplaying';
  static const movieTrailer = 'api/v1/movie/:id/trailer';
  static const movieDetails = 'api/v1/movie/:id/details';
  static const movieSimilar = 'api/v1/movie/:id/similar';
  static const movieRecommendations = 'api/v1/movie/:id/recommendations';
  static const moviesByCategory = 'api/v1/movie/:category';
}
