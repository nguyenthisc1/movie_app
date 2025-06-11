import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/wigets/appbar.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/presentation/home/widgets/trending.dart';
import 'package:movie_app/presentation/home/widgets/trending_text.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingText(),
            const SizedBox(height: 12),
            TrendingMovies(),
          ],
        ),
      ),
    );
  }
}
