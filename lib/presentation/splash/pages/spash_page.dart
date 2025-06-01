import 'package:flutter/material.dart';
import 'package:movie_app/core/configs/assets/app_images.dart';

class SpashPage extends StatelessWidget {
  const SpashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Color(0xff1A1B20).withAlpha(0), Color(0xff1A1B20)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
