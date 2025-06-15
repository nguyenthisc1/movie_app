import 'package:flutter/material.dart';
import 'package:movie_app/common/wigets/appbar/appbar.dart';
import 'package:movie_app/domain/tv/entities/tv_entity.dart';
import 'package:movie_app/presentation/watch/widgets/keyword_tv.dart';
import 'package:movie_app/presentation/watch/widgets/recomendation_tvs.dart';
import 'package:movie_app/presentation/watch/widgets/similar_tvs.dart';
import 'package:movie_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_app/presentation/watch/widgets/video_title.dart';
import 'package:movie_app/presentation/watch/widgets/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TVWatchPage({super.key, required this.tvEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tvEntity.id!),
            const SizedBox(height: 24),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(height: 24),
            KeywordTV(tvId: tvEntity.id!),
            const SizedBox(height: 24),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
            const SizedBox(height: 36),
            VideoOverview(overview: tvEntity.overview!),
            const SizedBox(height: 36),
            RecommendationTVs(tvId: tvEntity.id!),
            const SizedBox(height: 36),
            SimilarTVs(tvId: tvEntity.id!),
          ],
        ),
      ),
    );
  }
}
