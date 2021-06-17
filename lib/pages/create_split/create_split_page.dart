import 'package:flutter/material.dart';
import 'package:split_it/pages/create_split/create_split_controller.dart';
import 'package:split_it/pages/create_split/steps/step_one/step_one_page.dart';
import 'package:split_it/pages/create_split/steps/step_two/step_two_page.dart';
import 'package:split_it/pages/create_split/widgets/bottom_stepper_bar/bottom_stepper_bar_widget.dart';
import 'package:split_it/pages/create_split/widgets/create_split_app_bar/create_split_app_bar_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(
        onChange: (value) {
          controller.setEventName(value);
          setState(() {});
        },
      ),
      StepTwoPage(),
      Container(color: Colors.amber),
    ];
    super.initState();
  }

  var index = 0;

  void nextPage() {
    if (index < 2) {
      index++;
      setState(() {});
    }
  }

  void previousPage() {
    if (index > 0) {
      index--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppBarWidget(
        actualPage: (index + 1),
        lengthPages: pages.length,
        onTapBack: () {
          if (index > 0) {
            previousPage();
          } else {
            Navigator.pop(context);
          }
        },
      ),
      body: pages[index],
      bottomNavigationBar: BottomStepperBarWidget(
        enabledButtons: controller.enableNavigateButton(),
        onTapCancel: () {
          Navigator.pop(context);
        },
        onTapNext: () {
          nextPage();
        },
      ),
    );
  }
}
