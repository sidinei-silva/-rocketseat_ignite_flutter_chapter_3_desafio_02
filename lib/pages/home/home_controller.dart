import 'package:mobx/mobx.dart';
import 'package:split_it/pages/home/home_state.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/pages/home/repositories/home_repository_mock.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late HomeRepository homeRepository;

  @observable
  HomeState homeState = HomeStateEmpty();

  _HomeControllerBase({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  @action
  getEvents() async {
    homeState = HomeStateLoading();
    try {
      final response = await homeRepository.getEvents();
      homeState = HomeStateSuccess(events: response);
    } catch (e) {
      homeState = HomeStateFailure(message: e.toString());
    }
  }
}
