import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams params);
}
