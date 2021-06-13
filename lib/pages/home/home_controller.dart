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

  getEvents() async {
    update(HomeStateLoading());
    try {
      final response = await homeRepository.getEvents();
      update(HomeStateSuccess(events: response));
    } catch (e) {
      update(HomeStateFailure(message: e.toString()));
    }
  }

  void update(HomeState state) {
    this.homeState = state;
    if (onListen != null) {
      onListen!(homeState);
    }
  }

  void listen(Function(HomeState state) onChange) {
    onListen = onChange;
  }
}
