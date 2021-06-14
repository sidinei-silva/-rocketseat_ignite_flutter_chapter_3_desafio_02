import 'package:flutter/material.dart';
import 'package:split_it/pages/create_split/widgets/stepper_next_button/stepper_next_button_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  var pages = [
    Container(color: Colors.white),
    Container(color: Colors.purple),
    Container(color: Colors.amber),
  ];

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppTheme.colors.backButton,
                  ),
                  onPressed: () {
                    if (index > 0) {
                      previousPage();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text.rich(
                  TextSpan(
                    text: "0${index + 1}",
                    style: AppTheme.textStyles.stepIndicatorPrimary,
                    children: [
                      TextSpan(
                        text: "- 0${pages.length}",
                        style: AppTheme.textStyles.stepIndicatorSecondary,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: pages[index],
      bottomNavigationBar: SafeArea(
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
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                        thickness: 1,
                      ),
                      Expanded(
                        child: StepperNextButtonWidget(
                          label: "continuar",
                          onTap: () {
                            nextPage();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
