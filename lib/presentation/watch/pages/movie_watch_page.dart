import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/common/wigets/appbar/appbar.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/domain/movie/entities/movie_entity.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;

  const MovieWatchPage({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(child: SvgPicture.asset(AppVectors.logo)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [VideoPlayer(movieId: movieEntity.id!)],
        ),
      ),
    );
  }
}
