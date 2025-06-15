import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getTrailerMovie(int movieId);
  Future<Either> getDetailMovie(int movieId);
  Future<Either> getsimilarMovies(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getCategoryMovies(String category);
  Future<Either> searchMovie(String query);
}
