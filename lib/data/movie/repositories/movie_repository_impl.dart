import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie.dart';
import 'package:movie_app/common/helper/mapper/movie_trailer.dart';
import 'package:movie_app/core/models/movie_trailer_model.dart';
import 'package:movie_app/data/movie/models/movie_model.dart';
import 'package:movie_app/data/movie/sources/movie_api_service.dart';
import 'package:movie_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['content'];

        if (content is! List) return Left('Invalid data!');

        final movies =
            content
                .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['content'];

        if (content is! List) return Left('Invalid data!');

        final movies =
            content
                .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
                .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getTrailerMovie(int movieId) async {
    var returnedData = await sl<MovieService>().getTrailerMovie(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['trailer'];

        if (content == null) return Left('No trailer data found!');

        final trailer = MovieTrailerMapper.toEntity(
          TrailerModel.fromJson(content),
        );

        return Right(trailer);
      },
    );
  }

  @override
  Future<Either> getDetailMovie(int movieId) async {
    var returnedData = await sl<MovieService>().getDetailMovie(movieId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['detail'];

        if (content == null) return Left('No trailer data found!');

        final detail = MovieTrailerMapper.toEntity(
          TrailerModel.fromJson(content),
        );

        return Right(detail);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var returnedData = await sl<MovieService>().getRecommendationMovies(
      movieId,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['content'];

        if (content is! List) return Left('Invalid data!');

        var movies =
            content
                .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getsimilarMovies(int movieId) async {
    var returnedData = await sl<MovieService>().getSimilarMovies(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['content'];

        if (content is! List) return Left('Invalid data!');

        var movies =
            content
                .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> searchMovie(String query) async {
    var returnedData = await sl<MovieService>().searchMovie(query);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['content'];

        if (content is! List) return Left('Invalid data!');

        var movies =
            content
                .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getCategoryMovies(String category) async {
    // TODO: implement getRecommendationMovies
    throw UnimplementedError();
  }
}
