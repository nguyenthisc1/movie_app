// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> searchMovie(String query);
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.moviesTrending);

      return Right(response.data);
    } on DioException catch (e) {
      print('🧨 Dio Error: ${e.response?.data}');
      print('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) {
    // TODO: implement getTrendingMovies
    throw UnimplementedError();
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.moviesNowPlaying);

      return Right(response.data);
    } on DioException catch (e) {
      print('🧨 Dio Error: ${e.response?.data}');
      print('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) {
    // TODO: implement getRecommendationMovies
    throw UnimplementedError();
  }

  @override
  Future<Either> getSimilarMovies(int movieId) {
    // TODO: implement getSimilarMovies
    throw UnimplementedError();
  }

  @override
  Future<Either> searchMovie(String query) {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }
}
