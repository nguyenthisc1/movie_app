import 'package:flutter/widgets.dart';

class TrendingText extends StatelessWidget {
  const TrendingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 10),
      child: Text(
        'Trending ',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }
}
