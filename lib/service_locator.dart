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
import 'package:movie_app/domain/tv/usecases/get_keyword_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_trending_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_trailers_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_details_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_similar_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_recommendation_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_by_category_tv.dart';
import 'package:movie_app/domain/tv/usecases/search_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerLazySingleton<MovieService>(() => MovieApiServiceImpl());
  sl.registerLazySingleton<TVApiService>(() => TvApiServiceImpl());

  // Repositories
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
  sl.registerLazySingleton<GetTrendingTVUseCase>(() => GetTrendingTVUseCase());
  sl.registerLazySingleton<GetTrailersTVUseCase>(() => GetTrailersTVUseCase());
  sl.registerLazySingleton<GetDetailsTVUseCase>(() => GetDetailsTVUseCase());
  sl.registerLazySingleton<GetSimilarTVUseCase>(() => GetSimilarTVUseCase());
  sl.registerLazySingleton<GetRecommendationTVUseCase>(
    () => GetRecommendationTVUseCase(),
  );
  sl.registerLazySingleton<GetKeywordTVUseCase>(() => GetKeywordTVUseCase());
  sl.registerLazySingleton<GetByCategoryTVUseCase>(
    () => GetByCategoryTVUseCase(),
  );
  sl.registerLazySingleton<SearchTVUseCase>(() => SearchTVUseCase());
}
