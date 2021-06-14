import 'package:flutter/material.dart';
import 'package:split_it/pages/create_split/widgets/create_split_app_bar/create_split_app_bar_widget.dart';
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
