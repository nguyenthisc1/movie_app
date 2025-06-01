import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/configs/theme/app_theme.dart';
import 'package:movie_app/presentation/splash/pages/spash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: AppTheme.appTheme,
      home: SpashPage(),
    );
  }
}
