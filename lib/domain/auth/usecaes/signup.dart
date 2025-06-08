import 'package:dartz/dartz.dart';

import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/domain/auth/repositories/auth_repository.dart';

class SignupUsecase extends UseCase<Either, SignupReqParams> {
  final AuthRepository authRepository;
  SignupUsecase({required this.authRepository});

  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await authRepository.signup(params!);
  }
}
