import 'package:flutter/material.dart';
import 'package:split_it/pages/create_split/widgets/person_tile/person_tile_widget.dart';
import 'package:split_it/pages/create_split/widgets/step_input_text/step_input_text_widget.dart';
import 'package:split_it/pages/create_split/widgets/step_title/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: "Com quem",
          subtitle: "\nvocê quer dividir?",
        ),
        StepInputTextWidget(
          onChange: (value) {},
          hintText: "Nome da pessoa",
        ),
        SizedBox(height: 35),
        PersonTileWidget(name: "Sidinei Silva", isRemoved: true),
        PersonTileWidget(name: "Sidinei Silva"),
        PersonTileWidget(name: "Sidinei Silva", isRemoved: true),
      ],
    );
  }
}
