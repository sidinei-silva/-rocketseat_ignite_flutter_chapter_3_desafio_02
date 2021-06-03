import 'package:flutter/material.dart';
import 'package:split_it/core/app_images.dart';
import 'package:split_it/theme/app_theme.dart';

enum IconDollarType { send, receive }

class IconDollarWidget extends StatelessWidget {
  final IconDollarType iconDollarType;

  IconDollarWidget({Key? key, required this.iconDollarType}) : super(key: key);

  final config = {
    "receive": {
      "iconPath": AppImages.receivableIcon,
      "color": AppTheme.colors.cardBalanceValueReceivable
    },
    "send": {
      "iconPath": AppImages.payableIcon,
      "color": AppTheme.colors.cardBalanceValuePayable
    }
  };

  String get type => iconDollarType.toString().split('.').last;
  String get iconPath => config[type]!['iconPath'] as String;
  Color get color => config[type]!['color'] as Color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(iconPath),
      ),
    );
  }
}
