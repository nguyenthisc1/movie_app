import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app/service_locator.dart';

class GetSimilarTVUseCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TVRepository>().getSimilarTVs(params!);
  }
}
