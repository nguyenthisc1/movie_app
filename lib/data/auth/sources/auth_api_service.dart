import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/service_locator.dart';

abstract class AuthService {
  Future<Either> signup(SignupReqParams params);
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      print(params.toMap());
      print('🧨 Dio Error: ${e.response?.data}');
      print('🧨 Status code: ${e.response?.statusCode}');
      return Left(e.response!.data['message']);
    }
  }
}

class AuthFirebaseServiceImpl {
  @override
  Future<Either> signup(SignupReqParams params) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}

class AuthGoogleServiceImpl {
  @override
  Future<Either> signup(SignupReqParams params) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
