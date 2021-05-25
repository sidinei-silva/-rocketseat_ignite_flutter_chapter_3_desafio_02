import 'package:flutter/material.dart';

abstract class AppColors {
  Color get background;
}

class AppColorsDefault implements AppColors {
  @override
  Color get background => Color(0xFF40B38C);
}
