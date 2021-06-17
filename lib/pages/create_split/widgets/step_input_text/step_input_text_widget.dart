import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputTextWidget extends StatelessWidget {
  final Function(String value) onChange;
  final String hintText;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final disabledBorder;

  const StepInputTextWidget(
      {Key? key,
      required this.onChange,
      required this.hintText,
      this.textAlign = TextAlign.center,
      this.padding = const EdgeInsets.symmetric(horizontal: 64),
      this.disabledBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        onChanged: onChange,
        textAlign: textAlign,
        style: AppTheme.textStyles.stepperTextField,
        cursorColor: AppTheme.colors.backgroundSecondary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTheme.textStyles.stepperHintTextField,
          enabledBorder: UnderlineInputBorder(
            borderSide: disabledBorder
                ? BorderSide.none
                : BorderSide(
                    color: AppTheme.colors.stepperInputBorder,
                  ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: disabledBorder
                ? BorderSide.none
                : BorderSide(
                    color: AppTheme.colors.stepperInputBorder,
                  ),
          ),
          border: UnderlineInputBorder(
            borderSide: disabledBorder
                ? BorderSide.none
                : BorderSide(
                    color: AppTheme.colors.stepperInputBorder,
                  ),
          ),
        ),
      ),
    );
  }
}
