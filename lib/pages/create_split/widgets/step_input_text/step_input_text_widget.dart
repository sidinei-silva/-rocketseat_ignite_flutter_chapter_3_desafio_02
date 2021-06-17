import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputTextWidget extends StatelessWidget {
  final Function(String value) onChange;
  final String hintText;

  const StepInputTextWidget({
    Key? key,
    required this.onChange,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: TextField(
        onChanged: onChange,
        textAlign: TextAlign.center,
        style: AppTheme.textStyles.stepperTextField,
        cursorColor: AppTheme.colors.backgroundSecondary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTheme.textStyles.stepperHintTextField,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.stepperInputBorder,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.stepperInputBorder,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.colors.stepperInputBorder,
            ),
          ),
        ),
      ),
    );
  }
}
