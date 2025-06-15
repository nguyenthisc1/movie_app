import 'package:dartz/dartz.dart';

abstract class TVRepository {
  Future<Either> getTrendingTV();
  Future<Either> getPopularTV();
  Future<Either> getTrailersTV(int tvId);
  Future<Either> getDetailsTV(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getKeywordsTV(int tvId);
  Future<Either> getByCategoryTVs(String category);
  Future<Either> searchTV(String query);
}
