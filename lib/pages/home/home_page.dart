import 'package:flutter/material.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/pages/home/widgets/event_tile/event_tile_widget.dart';
import 'package:split_it/pages/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      appBar: AppBarWidget(
        user: user,
        buttonAddOnTap: () {},
      ),
      body: EventTileWidget(
        data: EventModel(
          title: 'Churrasco',
          date: DateTime.now(),
          people: 1,
          money: 32.0,
        ),
      ),
    );
  }
}
