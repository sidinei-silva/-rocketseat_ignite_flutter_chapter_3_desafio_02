import 'package:mobx/mobx.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/pages/home/repositories/home_repository_mock.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_state.dart';

part 'app_bar_controller.g.dart';

class AppBarController = _AppBarControllerBase with _$AppBarController;

abstract class _AppBarControllerBase with Store {
  late HomeRepository homeRepository;

  @observable
  AppBarState appBarState = AppBarStateEmpty();

  _AppBarControllerBase({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  @action
  getDashboard() async {
    appBarState = AppBarStateLoading();
    try {
      final response = await homeRepository.getDashboard();
      appBarState = AppBarStateSuccess(dashboard: response);
    } catch (e) {
      appBarState = AppBarStateFailure(message: e.toString());
    }
  }
}
