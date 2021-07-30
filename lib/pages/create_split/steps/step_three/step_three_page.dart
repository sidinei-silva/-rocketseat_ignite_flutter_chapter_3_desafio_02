import 'package:flutter/material.dart';
import 'package:split_it/pages/create_split/widgets/step_input_text/step_input_text_widget.dart';
import 'package:split_it/pages/create_split/widgets/step_title/step_title_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class StepThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: "Qual ou quais",
          subtitle: "\nítens você quer dividir?",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: AppTheme.colors.stepperInputBorder,
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text("1"),
                ),
                Expanded(
                  flex: 3,
                  child: StepInputTextWidget(
                    padding: EdgeInsets.zero,
                    onChange: (value) {},
                    hintText: "Ex. Picanha",
                    textAlign: TextAlign.start,
                    disabledBorder: true,
                  ),
                ),
                Expanded(
                  child: StepInputTextWidget(
                    padding: EdgeInsets.zero,
                    onChange: (value) {},
                    hintText: "R\$ 0,00",
                    textAlign: TextAlign.start,
                    disabledBorder: true,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
