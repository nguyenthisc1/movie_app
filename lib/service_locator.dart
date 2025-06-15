import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth_repository_impl.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/movie/repositories/movie_repository_impl.dart';
import 'package:movie_app/data/movie/sources/movie_api_service.dart';
import 'package:movie_app/data/tv/repositories/tv_repository_impl.dart';
import 'package:movie_app/data/tv/sources/tv_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth_repository.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app/domain/movie/usecases/get_category_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_detail_movie.dart';
import 'package:movie_app/domain/movie/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_trailer_movie_usecase.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:movie_app/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerLazySingleton<MovieService>(() => MovieApiServiceImpl());
  sl.registerLazySingleton<TVApiService>(() => TvApiServiceImpl());

  // Repostories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());
  sl.registerLazySingleton<TVRepository>(() => TVRepositoryImpl());

  // Usecases
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<SigninUseCase>(() => SigninUseCase());
  sl.registerLazySingleton<IsLoggedInUseCase>(() => IsLoggedInUseCase());
  sl.registerLazySingleton<GetTrendingMoviesUseCase>(
    () => GetTrendingMoviesUseCase(),
  );
  sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
    () => GetNowPlayingMoviesUseCase(),
  );
  sl.registerLazySingleton<GetTrailerMovieUseCase>(
    () => GetTrailerMovieUseCase(),
  );
  sl.registerLazySingleton<GetDetailMovieUseCase>(
    () => GetDetailMovieUseCase(),
  );
  sl.registerLazySingleton<GetSimilarMoviesUseCase>(
    () => GetSimilarMoviesUseCase(),
  );
  sl.registerLazySingleton<GetRecommendationMoviesUseCase>(
    () => GetRecommendationMoviesUseCase(),
  );
  sl.registerLazySingleton<GetCategoryMoviesUseCase>(
    () => GetCategoryMoviesUseCase(),
  );
  sl.registerLazySingleton<GetPopularTVUseCase>(() => GetPopularTVUseCase());
}
