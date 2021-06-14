import 'package:flutter/material.dart';
import 'package:split_it/pages/create_split/widgets/bottom_stepper_bar/bottom_stepper_bar_widget.dart';
import 'package:split_it/pages/create_split/widgets/create_split_app_bar/create_split_app_bar_widget.dart';
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
      bottomNavigationBar: BottomStepperBarWidget(
        onTapCancel: () {
          Navigator.pop(context);
        },
        onTapNext: (){
          nextPage();
        },
      ),
    );
  }
}
