import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundSecondary;
  Color get backgroundPrimary;
  Color get border;
  Color get textButtonPrimary;
  Color get textSecondary;
  Color get borderButtonAdd;
  Color get iconButtonAdd;
}

class AppColorsDefault implements AppColors {
  @override
  Color get backgroundPrimary => Color(0xFFFFFFFF);

  @override
  Color get backgroundSecondary => Color(0xFF40B28C);

  @override
  Color get border => Color(0xFFDCE0E5);

  @override
  Color get textButtonPrimary => Color(0xFF666666);

  @override
  Color get textSecondary => Color(0xFFFFFFFF);

  @override
  Color get borderButtonAdd => Color(0xFFF5F5F5).withOpacity(0.25);

  @override
  Color get iconButtonAdd => Color(0xFFF5F5F5);

}
