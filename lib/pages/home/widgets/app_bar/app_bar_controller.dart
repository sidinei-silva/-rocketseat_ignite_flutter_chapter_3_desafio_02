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

  getDashboard() async {
    update(AppBarStateLoading());
    try {
      final response = await homeRepository.getDashboard();
      update(AppBarStateSuccess(dashboard: response));
    } catch (e) {
      update(AppBarStateFailure(message: e.toString()));
    }
  }

  void update(AppBarState state) {
    this.appBarState = state;
    if (onListen != null) {
      onListen!(appBarState);
    }
  }

  void listen(Function(AppBarState state) onChange) {
    onListen = onChange;
  }
}
