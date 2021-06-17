import 'package:flutter/material.dart';
import 'package:split_it/pages/create_split/widgets/stepper_next_button/stepper_next_button_widget.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;

  final bool enabledButtons;

  const BottomStepperBarWidget({
    Key? key,
    required this.onTapCancel,
    required this.onTapNext,
    this.enabledButtons = false,
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
                    Expanded(
                      child: StepperNextButtonWidget(
                        label: "cancelar",
                        enabled: enabledButtons,
                        onTap: onTapCancel,
                      ),
                    ),
                    VerticalDivider(
                      width: 1,
                      thickness: 1,
                    ),
                    Expanded(
                      child: StepperNextButtonWidget(
                        label: "continuar",
                        enabled: enabledButtons,
                        onTap: onTapNext,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
