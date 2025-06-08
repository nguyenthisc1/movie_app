import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth_repository.dart';

// class AuthRepositoryImpl extends AuthRepository {
//   final bool useFirebase;
//   final bool useGoogle;

//   AuthRepositoryImpl({required this.useFirebase, required this.useGoogle});

//   @override
//   Future<Either> signup(SignupReqParams params) async {
//     if (useFirebase) {
//       return await AuthFirebaseServiceImpl().signup(params);
//     } else if (useGoogle) {
//       return await AuthGoogleServiceImpl().signup(params);
//     } else {
//       return await AuthApiServiceImpl().signup(params);
//     }
//   }
// }

// var data = AuthRepositoryImpl(useFirebase: true, useGoogle: false);

// var data2 = AuthRepositoryImpl(useFirebase: false, useGoogle: true);

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService authApiService;

  AuthRepositoryImpl({required this.authApiService});

  @override
  Future<Either<String, dynamic>> signup(SignupReqParams params) {
    return authApiService.signup(params);
  }
}
