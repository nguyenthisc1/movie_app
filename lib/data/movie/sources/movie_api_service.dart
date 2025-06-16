// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getTrailerMovie(int movieId);
  Future<Either> getDetailMovie(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> searchMovie(String query);
}

class MovieApiServiceImpl extends MovieService {
  Logger logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.moviesTrending);

      return Right(response.data);
    } on DioException catch (e) {
      logger.d('🧨 Dio Error: ${e.response?.data}');
      logger.d('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getTrailerMovie(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movieUrl}/$movieId/trailer',
      );

      logger.d(response);

      return Right(response.data);
    } on DioException catch (e) {
      logger.d('🧨 Dio Error: ${e.response?.data}');
      logger.d('🧨 Status code: ${e.response?.statusCode}');
      final errorData = e.response?.data;
      String errorMessage = 'No trailer data found!.';

      if (errorData is Map<String, dynamic> &&
          errorData.containsKey('message')) {
        errorMessage = errorData['message'];
      } else if (errorData is String) {
        errorMessage = errorData;
      }

      return Left(errorMessage);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.moviesNowPlaying);

      return Right(response.data);
    } on DioException catch (e) {
      logger.d('🧨 Dio Error: ${e.response?.data}');
      logger.d('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movieUrl}/$movieId/recommendations',
      );

      return Right(response.data);
    } on DioException catch (e) {
      logger.d('🧨 Dio Error: ${e.response?.data}');
      logger.d('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movieUrl}/$movieId/similar',
      );

      return Right(response.data);
    } on DioException catch (e) {
      logger.d('🧨 Dio Error: ${e.response?.data}');
      logger.d('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> searchMovie(String query) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.search}movie/$query');
      return Right(response.data);
    } on DioException catch (e) {
      logger.d('🧨 Dio Error: ${e.response?.data}');
      logger.d('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getDetailMovie(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movieUrl}/$movieId/details',
      );

      return Right(response.data);
    } on DioException catch (e) {
      logger.d('🧨 Dio Error: ${e.response?.data}');
      logger.d('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }
}
