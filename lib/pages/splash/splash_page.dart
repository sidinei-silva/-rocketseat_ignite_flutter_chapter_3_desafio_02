import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:split_it/core/app_images.dart';
import 'package:split_it/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeFirebase() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {}
  }

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.gradients.background,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Opacity(
                opacity: 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImages.rectangleLeft,
                      width: 198,
                      height: 98,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Image.asset(
                      AppImages.rectangleLeft,
                      width: 114,
                      height: 54,
                    ),
                  ],
                ),
              ),
              Image.asset(
                AppImages.logo,
                width: 129,
                height: 112,
              ),
              Opacity(
                opacity: 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppImages.rectangleRight,
                      width: 114,
                      height: 54,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Image.asset(
                      AppImages.rectangleRight,
                      width: 198,
                      height: 98,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
