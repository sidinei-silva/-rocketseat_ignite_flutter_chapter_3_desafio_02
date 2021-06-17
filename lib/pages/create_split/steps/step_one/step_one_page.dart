import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepOnePage extends StatefulWidget {
  final Function(String value) onChange;
  StepOnePage({Key? key, required this.onChange}) : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Qual o nome",
            style: AppTheme.textStyles.stepperTitle,
            children: [
              TextSpan(
                text: "\ndo evento?",
                style: AppTheme.textStyles.stepperSubtitle,
              )
            ],
          ),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: TextField(
            onChanged: widget.onChange,
            textAlign: TextAlign.center,
            style: AppTheme.textStyles.stepperTextField,
            cursorColor: AppTheme.colors.backgroundSecondary,
            decoration: InputDecoration(
              hintText: "Ex. Churrasco",
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
        ),
      ],
    );
  }
}
