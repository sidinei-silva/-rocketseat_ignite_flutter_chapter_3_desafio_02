import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get userNameAppBar;
  TextStyle get cardBalanceLabel;
  TextStyle get cardBalanceValueReceivable;
  TextStyle get cardBalanceValuePayable;
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

  @override
  TextStyle get userNameAppBar => GoogleFonts.montserrat(
        fontSize: 24,
        color: AppTheme.colors.textSecondary,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get cardBalanceLabel => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.cardBalanceLabel,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get cardBalanceValueReceivable => GoogleFonts.inter(
        fontSize: 20,
        color: AppTheme.colors.cardBalanceValueReceivable,
        fontWeight: FontWeight.w600,
      );
  @override
  TextStyle get cardBalanceValuePayable => GoogleFonts.inter(
        fontSize: 20,
        color: AppTheme.colors.cardBalanceValuePayable,
        fontWeight: FontWeight.w600,
      );
}
