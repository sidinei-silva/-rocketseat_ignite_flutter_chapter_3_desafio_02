import 'package:flutter/material.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/pages/home/widgets/event_tile/event_tile_widget.dart';
import 'package:split_it/pages/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  final events = [
    EventModel(
      title: 'Churrasco',
      date: DateTime.now(),
      people: 5,
      money: 32.0,
    ),
    EventModel(
      title: 'Aniversario',
      date: DateTime.now(),
      people: 10,
      money: -11.0,
    ),
    EventModel(
      title: 'Festa',
      date: DateTime.now(),
      people: 0,
      money: -20.0,
    ),
    EventModel(
      title: 'Fogueira',
      date: DateTime.now(),
      people: 11,
      money: 10.0,
    ),
    EventModel(
      title: 'Natal',
      date: DateTime.now(),
      people: 5,
      money: 15.0,
    ),
    EventModel(
      title: 'Arraia',
      date: DateTime.now(),
      people: 5,
      money: 25.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: AppBarWidget(
        user: user,
        buttonAddOnTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...events.map(
              (event) => EventTileWidget(data: event),
            )
          ],
        ),
      ),
    );
  }
}
