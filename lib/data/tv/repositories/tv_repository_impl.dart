import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/keyword.dart';
import 'package:movie_app/common/helper/mapper/tv.dart';
import 'package:movie_app/core/models/keyword_model.dart';
import 'package:movie_app/data/tv/models/tv_model.dart';
import 'package:movie_app/data/tv/sources/tv_api_service.dart';
import 'package:movie_app/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getTrendingTV() async {
    var returnedData = await sl<TVApiService>().getTrendingTV();

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

  @override
  Future<Either> getPopularTV() async {
    var returnedData = await sl<TVApiService>().getPopularTV();

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

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    var returnedData = await sl<TVApiService>().getRecommendationTVs(tvId);

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

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    var returnedData = await sl<TVApiService>().getSimilarTVs(tvId);

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

  @override
  Future<Either> getDetailsTV(int tvId) async {
    var returnedData = await sl<TVApiService>().getTVDetails(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['details'];

        if (content == null) return Left('No details data found!');

        final details = TVMapper.toEntity(TVModel.fromJson(content));

        return Right(details);
      },
    );
  }

  @override
  Future<Either> getKeywordsTV(int tvId) async {
    var returnedData = await sl<TVApiService>().getTVKeywords(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['content'];

        if (content is! List) return Left('Invalid data!');

        var movies =
            content
                .map(
                  (item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)),
                )
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getTrailersTV(int tvId) async {
    var returnedData = await sl<TVApiService>().getTVTrailers(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['trailer'];

        if (content is! List) return Left('Invalid data!');

        final trailer =
            content
                .map((item) => TVMapper.toEntity(TVModel.fromJson(item)))
                .toList();

        return Right(trailer);
      },
    );
  }

  @override
  Future<Either> searchTV(String query) async {
    var returnedData = await sl<TVApiService>().searchTV(query);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final content = data['content'];

        if (content is! List) return Left('Invalid data!');

        final tvShows =
            content
                .map((item) => TVMapper.toEntity(TVModel.fromJson(item)))
                .toList();

        return Right(tvShows);
      },
    );
  }

  @override
  Future<Either> getByCategoryTVs(String category) {
    // TODO: implement getTVsByCategory
    throw UnimplementedError();
  }
}
