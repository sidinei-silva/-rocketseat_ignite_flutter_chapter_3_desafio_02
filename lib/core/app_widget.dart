import 'package:flutter/material.dart';
import 'package:split_it/pages/create_split/create_split_page.dart';
import 'package:split_it/pages/home/home_page.dart';
import 'package:split_it/pages/login/login_page.dart';
import 'package:split_it/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Split.it",
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/error": (context) => LoginPage(),
        "/create_split": (context) => CreateSplitPage(),
      },
    );
  }
}
