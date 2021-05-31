import 'package:flutter/material.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/pages/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      appBar: AppBarWidget(
        user: user,
      ),
      body: Container(
        color: AppTheme.colors.backgroundPrimary,
      ),
    );
  }
}
