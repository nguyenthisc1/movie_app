import 'package:movie_app/domain/movie/entities/movie_entity.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  NowPlayingMoviesLoaded({required this.movies});
}

class FailureLoadedNowPlayingMovies extends NowPlayingState {
  final String errorMessage;
  FailureLoadedNowPlayingMovies({required this.errorMessage});
}
