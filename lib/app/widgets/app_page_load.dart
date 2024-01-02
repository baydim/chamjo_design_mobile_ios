import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class AppPageLoad extends StatelessWidget {
  const AppPageLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
        child: Center(
      child: CircularProgressIndicator(
        color: orangeColor,
      ),
    ));
  }
}
