import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/wigets/appbar/appbar.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv.dart';
import 'package:movie_app/presentation/home/widgets/trending_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(child: SvgPicture.asset(AppVectors.logo)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trending'),
            const SizedBox(height: 12),
            TrendingMovies(),
            const SizedBox(height: 24),
            CategoryText(title: 'Now Playing'),
            const SizedBox(height: 12),
            NowPlayingMovies(),
            const SizedBox(height: 24),
            CategoryText(title: 'Popular TV'),
            const SizedBox(height: 12),
            PopularTv(),
          ],
        ),
      ),
    );
  }
}
