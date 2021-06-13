import 'package:flutter/material.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/pages/home/repositories/home_repository_mock.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_state.dart';

class AppBarController {
  late HomeRepository homeRepository;

  AppBarState appBarState = AppBarStateEmpty();

  AppBarController() {
    homeRepository = HomeRepositoryMock();
  }

  getDashboard(VoidCallback onUpdate) async {
    appBarState = AppBarStateLoading();
    final response = await homeRepository.getDashboard();
    appBarState = AppBarStateSuccess(dashboard: response);
    onUpdate();
  }
}
