import 'package:movie_app/domain/movie/entities/movie_entity.dart';
import 'package:movie_app/domain/tv/entities/tv_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MoviesLoaded extends SearchState {
  final List<MovieEntity> movies;
  MoviesLoaded({required this.movies});
}

class TVsLoaded extends SearchState {
  final List<TVEntity> tvs;
  TVsLoaded({required this.tvs});
}

class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({required this.errorMessage});
}
