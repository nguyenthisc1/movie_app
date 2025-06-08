import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth_repository.dart';
import 'package:movie_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  @override
  Future<Either> signup(SignupReqParams params) async {
    var data = await sl<AuthService>().signup(params);
    return data.fold(
      (error) {
        print(error);
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return Right(data);
      },
    );
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthService>().signin(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return Right(data);
      },
    );
  }
}
