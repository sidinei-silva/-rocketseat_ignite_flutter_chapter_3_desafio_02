import 'package:flutter/material.dart';
import 'package:split_it/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Split.it",
      home: SplashPage(),
    );
  }
}
