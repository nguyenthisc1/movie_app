import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';

abstract class AuthApiService {
  Future<Either<String, dynamic>> signup(SignupReqParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  final DioClient dioClient;

  AuthApiServiceImpl(this.dioClient);

  @override
  Future<Either<String, dynamic>> signup(SignupReqParams params) async {
    try {
      final response = await dioClient.post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Signup failed');
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
