import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/pages/create_split/steps/step_two/step_two_controller.dart';
import 'package:split_it/pages/create_split/widgets/person_tile/person_tile_widget.dart';
import 'package:split_it/pages/create_split/widgets/step_input_text/step_input_text_widget.dart';
import 'package:split_it/pages/create_split/widgets/step_title/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  final controller = StepTwoController();

  @override
  void initState() {
    controller.getFriends();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: "Com quem",
          subtitle: "\nvocê quer dividir?",
        ),
        StepInputTextWidget(
          onChange: (value) {
            controller.onChange(value);
          },
          hintText: "Nome da pessoa",
        ),
        SizedBox(height: 35),
        Observer(builder: (_) {
          if (controller.items.isEmpty) {
            return Text("Nenhum amigo");
          } else {
            return Column(
              children: controller.items
                  .map(
                    (e) => PersonTileWidget(name: e['name']),
                  )
                  .toList(),
            );
          }
        }),
      ],
    );
  }
}
