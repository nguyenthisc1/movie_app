import 'package:flutter/material.dart';
import 'package:movie_app/common/wigets/appbar/appbar.dart';
import 'package:movie_app/domain/movie/entities/movie_entity.dart';

import '../widgets/video_overview.dart';
import '../widgets/video_player.dart';
import '../widgets/video_release_date.dart';
import '../widgets/video_title.dart';
import '../widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(movieId: movieEntity.id!),
            const SizedBox(height: 16),
            VideoTitle(title: movieEntity.title!),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
              ],
            ),
            const SizedBox(height: 16),
            VideoOverview(overview: movieEntity.overview!),
            const SizedBox(height: 16),
            // RecommendationMovies(movieId: movieEntity.id!,),
            const SizedBox(height: 16),
            // SimilarMovies(movieId: movieEntity.id!,)
          ],
        ),
      ),
    );
  }
}
