import 'package:movie_app/domain/movie/entities/movie_entity.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({required this.movies});
}

class FailureLoadedTrendingMovies extends TrendingState {
  final String errorMessage;
  FailureLoadedTrendingMovies({required this.errorMessage});
}
