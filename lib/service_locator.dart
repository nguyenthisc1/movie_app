import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth_repository.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/movie/repositories/movie_repository.dart';
import 'package:movie_app/data/movie/sources/movie_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth_repository.dart';
import 'package:movie_app/domain/auth/usecaes/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecaes/signin.dart';
import 'package:movie_app/domain/auth/usecaes/signup.dart';
import 'package:movie_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app/domain/movie/usecaes/get_trending_movies.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerLazySingleton<MovieService>(() => MovieApiServiceImpl());

  // Repostories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());

  // Usecases
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<SigninUseCase>(() => SigninUseCase());
  sl.registerLazySingleton<IsLoggedInUseCase>(() => IsLoggedInUseCase());
  sl.registerLazySingleton<GetTrendingMoviesUseCase>(
    () => GetTrendingMoviesUseCase(),
  );
}
