import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class ButtonAddWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ButtonAddWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(color: AppTheme.colors.borderButtonAdd, width: 1.5),
          ),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: AppTheme.colors.iconButtonAdd,
          ),
        ),
      ),
    );
  }
}
