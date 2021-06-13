import 'package:flutter/material.dart';
import 'package:split_it/pages/home/home_state.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/pages/home/repositories/home_repository_mock.dart';

class HomeController {
  late HomeRepository homeRepository;

  HomeState homeState = HomeStateEmpty();

  HomeController() {
    homeRepository = HomeRepositoryMock();
  }

  getEvents(VoidCallback onUpdate) async {
    homeState = HomeStateLoading();
    final response = await homeRepository.getEvents();
    homeState = HomeStateSuccess(events: response);
    onUpdate();
  }
}
