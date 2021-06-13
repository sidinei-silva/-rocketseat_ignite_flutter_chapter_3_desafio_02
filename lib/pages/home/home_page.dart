import 'package:flutter/material.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/pages/home/repositories/home_repository_mock.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/pages/home/widgets/event_tile/event_tile_widget.dart';
import 'package:split_it/pages/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final events = <EventModel>[];
  late HomeRepository homeRepository;

  void getEvents() async {
    final response = await homeRepository.getEvents();
    events.addAll(response);
    setState(() {});
  }

  @override
  void initState() {
    homeRepository = HomeRepositoryMock();
    getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: AppBarWidget(
        receivable: 124,
        payable: -48,
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
