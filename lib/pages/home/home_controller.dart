import 'package:flutter/material.dart';
import 'package:split_it/pages/home/home_state.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/pages/home/repositories/home_repository_mock.dart';

class HomeController {
  late HomeRepository homeRepository;

  HomeState homeState = HomeStateEmpty();

  Function(HomeState state)? onListen;

  HomeController({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  getEvents(VoidCallback onUpdate) async {
    homeState = HomeStateLoading();
    update();
    try {
      final response = await homeRepository.getEvents();
      homeState = HomeStateSuccess(events: response);
      update();
    } catch (e) {
      homeState = HomeStateFailure(message: e.toString());
      update();
    }
    onUpdate();
  }

  void update() {
    if (onListen != null) {
      onListen!(homeState);
    }
  }

  void listen(Function(HomeState state) onChange) {
    onListen = onChange;
  }
}
