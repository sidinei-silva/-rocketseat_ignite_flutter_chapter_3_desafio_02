import 'package:flutter/material.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/pages/home/repositories/home_repository_mock.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_state.dart';

class AppBarController {
  late HomeRepository homeRepository;

  AppBarState appBarState = AppBarStateEmpty();

  Function(AppBarState state)? onListen;

  AppBarController({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  getDashboard(VoidCallback onUpdate) async {
    appBarState = AppBarStateLoading();
    update();
    try {
      final response = await homeRepository.getDashboard();
      appBarState = AppBarStateSuccess(dashboard: response);
      update();
    } catch (e) {
      appBarState = AppBarStateFailure(message: e.toString());
      update();
    }
    onUpdate();
  }

  void update() {
    if (onListen != null) {
      onListen!(appBarState);
    }
  }

  void listen(Function(AppBarState state) onChange) {
    onListen = onChange;
  }
}
