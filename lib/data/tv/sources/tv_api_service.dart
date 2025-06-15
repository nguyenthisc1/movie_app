import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class TVApiService {
  Future<Either> getTrendingTV();
  Future<Either> getPopularTV();
  Future<Either> getTVTrailers(int tvId);
  Future<Either> getTVDetails(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getTVKeywords(int tvId);
  Future<Either> getTVsByCategory(String category);
  Future<Either> searchTV(String query);
}

class TvApiServiceImpl extends TVApiService {
  Logger logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  Future<Either> getTrendingTV() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.tvTrending);

      return Right(response.data);
    } on DioException catch (e) {
      logger.d('🧨 Dio Error: ${e.response?.data}');
      logger.d('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getPopularTV() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.tvPopular);

      return Right(response.data);
    } on DioException catch (e) {
      logger.d('🧨 Dio Error: ${e.response?.data}');
      logger.d('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tvUrl}$tvId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tvUrl}$tvId/similar');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getTVKeywords(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tvUrl}$tvId/keywords');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> searchTV(String query) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.search}tv/$query');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getTVDetails(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tvUrl}$tvId/details');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getTVTrailers(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tvUrl}$tvId/trailers');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getTVsByCategory(String category) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.tvUrl}$category');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
