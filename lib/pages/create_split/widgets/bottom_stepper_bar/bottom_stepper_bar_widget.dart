import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:split_it/pages/create_split/create_split_controller.dart';
import 'package:split_it/pages/create_split/widgets/stepper_next_button/stepper_next_button_widget.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;
  final CreateSplitController controller;

  const BottomStepperBarWidget({
    Key? key,
    required this.onTapCancel,
    required this.onTapNext,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
          height: 50,
          child: Column(
            children: [
              Divider(
                height: 1,
                thickness: 1,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Observer(
                      builder: (_) {
                        return StepperNextButtonWidget(
                          label: "cancelar",
                          enabled: controller.enableNavigateButton,
                          onTap: onTapCancel,
                        );
                      },
                    )),
                    VerticalDivider(
                      width: 1,
                      thickness: 1,
                    ),
                    Expanded(child: Observer(
                      builder: (_) {
                        return StepperNextButtonWidget(
                          label: "continuar",
                          enabled: controller.enableNavigateButton,
                          onTap: onTapNext,
                        );
                      },
                    ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
