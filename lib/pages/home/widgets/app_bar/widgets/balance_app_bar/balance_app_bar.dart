import 'package:flutter/material.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_state.dart';
import 'package:split_it/pages/home/widgets/app_bar/widgets/card_balance/card_balance_widget.dart';

class BalanceAppBar extends StatefulWidget {
  BalanceAppBar({Key? key}) : super(key: key);

  @override
  _BalanceAppBarState createState() => _BalanceAppBarState();
}

class _BalanceAppBarState extends State<BalanceAppBar> {
  final appBarController = AppBarController();

  @override
  void initState() {
    appBarController.getDashboard(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (appBarController.appBarState.runtimeType) {
      case AppBarStateLoading:
        {
          return CircularProgressIndicator();
        }
      case AppBarStateSuccess:
        {
          final dashboard =
              (appBarController.appBarState as AppBarStateSuccess).dashboard;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              children: [
                CardBalanceWidget(value: dashboard.receivable),
                SizedBox(
                  width: 15,
                ),
                CardBalanceWidget(
                  value: dashboard.payable < 0
                      ? dashboard.payable
                      : -dashboard.payable,
                ),
              ],
            ),
          );
        }
      case AppBarStateFailure:
        {
          final message =
              (appBarController.appBarState as AppBarStateFailure).message;
          return Text(message);
        }
      default:
        {
          return Container();
        }
    }
  }
}
