import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get title => GoogleFonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        foreground: Paint()
          ..shader = LinearGradient(
            colors: <Color>[Color(0xFF40B28C), Color(0xFF45CC93)],
          ).createShader(Rect.fromLTWH(0.0, 0.0, 247.0, 70.0)),
      );

  @override
  TextStyle get button => GoogleFonts.inter(
        fontSize: 16,
        color: AppTheme.colors.textButtonPrimary,
        fontWeight: FontWeight.w400,
        height: 1.4,
      );
}
