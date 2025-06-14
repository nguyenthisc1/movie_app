import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/tv.dart';
import 'package:movie_app/data/tv/models/tv_model.dart';
import 'package:movie_app/data/tv/sources/tv_api_service.dart';
import 'package:movie_app/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopolarTV() async {
    var returnedData = await sl<TVApiService>().getPopolarTV();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['content'];

        if (content is! List) return Left('Invalid data!');

        final tvs =
            content
                .map((item) => TVMapper.toEntity(TVModel.fromJson(item)))
                .toList();

        return Right(tvs);
      },
    );
  }
}
