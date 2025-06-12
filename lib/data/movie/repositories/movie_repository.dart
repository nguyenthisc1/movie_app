import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie.dart';
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
}
