class ApiUrl {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:8080/',
  );

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
  static const moviesTrending = '$apiV/movie/trending';
  static const moviesNowPlaying = '$apiV/movie/nowplaying';
  static const movieTrailer = '$apiV/movie/:id/trailer';
  static const movieDetails = '$apiV/movie/:id/details';
  static const movieSimilar = '$apiV/movie/:id/similar';
  static const movieRecommendations = '$apiV/movie/:id/recommendations';
  static const moviesByCategory = '$apiV/movie/:category';

  // TV Shows
  static const tvTrending = '$apiV/tv/trending';
  static const tvPopular = '$apiV/tv/popular';
  static const tvTrailers = '$apiV/tv/:id/trailers';
  static const tvDetails = '$apiV/tv/:id/details';
  static const tvSimilar = '$apiV/tv/:id/similar';
  static const tvRecommendations = '$apiV/tv/:id/recommendations';
  static const tvKeywords = '$apiV/tv/:id/keywords';
  static const tvsByCategory = '$apiV/tv/:category';
}
