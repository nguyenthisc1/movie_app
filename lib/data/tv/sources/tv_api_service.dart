import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class TVApiService {
  Future<Either> getPopolarTV();
}

class TvApiServiceImpl extends TVApiService {
  @override
  Future<Either> getPopolarTV() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.tvPopular);

      return Right(response.data);
    } on DioException catch (e) {
      print('🧨 Dio Error: ${e.response?.data}');
      print('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }
}
