import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundSecondary;
  Color get backgroundPrimary;
  Color get border;
  Color get textButtonPrimary;
  Color get textSecondary;
  Color get borderButtonAdd;
  Color get iconButtonAdd;
  Color get cardBalanceLabel;
  Color get cardBalanceValueReceivable;
  Color get cardBalanceValuePayable;

  // Event Tile
  Color get eventTileTitle;
  Color get eventTileDate;
  Color get eventTileMoney;
  Color get eventTilePeople;
  Color get eventTileDivider;

  //Step Indicator
  Color get stepIndicatorPrimary;
  Color get stepIndicatorSecondary;
  Color get backButton;

  Color get stepperNextButtonText;
  Color get stepperNextButtonTextDisabled;

  Color get stepperTitle;
  Color get stepperSubtitle;

  Color get stepperHintTextField;
  Color get stepperTextField;

  Color get stepperInputBorder;

  Color get personTileName;
  Color get personTileNameAdded;
  Color get personTileIconAdd;
  Color get personTileIconRemove;
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

  @override
  Color get cardBalanceLabel => Color(0xFF666666);

  @override
  Color get cardBalanceValueReceivable => Color(0xFF40B28C);

  @override
  Color get cardBalanceValuePayable => Color(0xFFE83F5B);

  @override
  Color get eventTileDate => Color(0xFF666666);

  @override
  Color get eventTileMoney => Color(0xFF666666);

  @override
  Color get eventTilePeople => Color(0xFFA4B2AE);

  @override
  Color get eventTileTitle => Color(0xFF455250);

  @override
  Color get eventTileDivider => Color(0xFF666666);

  @override
  Color get stepIndicatorPrimary => Color(0xFF42BC8F);

  @override
  Color get stepIndicatorSecondary => Color(0xFF666666);

  @override
  Color get backButton => Color(0xFF666666);

  @override
  Color get stepperNextButtonText => Color(0xFF455250);

  @override
  Color get stepperSubtitle => Color(0xFF455250);

  @override
  Color get stepperTitle => Color(0xFF455250);

  @override
  Color get stepperHintTextField => Color(0xFF666666);

  @override
  Color get stepperTextField => Color(0xFF455250);

  @override
  Color get stepperInputBorder => Color(0xFF455250);

  @override
  Color get stepperNextButtonTextDisabled => Color(0xFF666666);

  @override
  Color get personTileIconAdd => Color(0xFF40B28C);

  @override
  Color get personTileIconRemove => Color(0xFFE83F5B);

  @override
  Color get personTileName => Color(0xFF666666);

  @override
  Color get personTileNameAdded => Color(0xFF455250);
}
