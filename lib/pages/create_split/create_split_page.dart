import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/pages/create_split/create_split_controller.dart';
import 'package:split_it/pages/create_split/steps/step_one/step_one_page.dart';
import 'package:split_it/pages/create_split/steps/step_three/step_three_page.dart';
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
        },
      ),
      StepTwoPage(),
      StepThreePage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppBarWidget(
        controller: controller,
        lengthPages: pages.length,
        onTapBack: controller.previousPage,
      ),
      body: Observer(
        builder: (_) {
          final index = controller.currentPage;
          return pages[index];
        },
      ),
      bottomNavigationBar: BottomStepperBarWidget(
        enabledButtons: controller.enableNavigateButton(),
        onTapCancel: () {
          Navigator.pop(context);
        },
        onTapNext: controller.nextPage,
      ),
    );
  }
}
