import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/pages/home/models/dashboard_model.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/pages/home/widgets/app_bar/app_bar_state.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late AppBarController appBarController;
  late HomeRepository homeRepository;

  setUp(() {
    homeRepository = HomeRepositoryMock();

    appBarController = AppBarController(homeRepository: homeRepository);
  });

  test("Testando o GetEvents - Retornando sucesso", () async {
    expect(appBarController.appBarState, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    appBarController.listen((state) => states.add(state));

    when(homeRepository.getDashboard)
        .thenAnswer((_) async => DashboardModel(receivable: 250, payable: -50));

    await appBarController.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateSuccess>());
    expect(states.length, 2);
  });

  test("Testando o GetEvents - Retornando falha", () async {
    expect(appBarController.appBarState, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    appBarController.listen((state) => states.add(state));

    when(homeRepository.getDashboard).thenThrow("Deu error");

    await appBarController.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateFailure>());
    expect((states[1] as AppBarStateFailure).message, "Deu error");
    expect(states.length, 2);
  });

  test("Testando o método listen", () async {
    appBarController.appBarState = AppBarStateLoading();
    appBarController
        .listen((state) => expect(state, isInstanceOf<AppBarStateLoading>()));
  });

  test("Testando o método update", () async {
    appBarController.appBarState = AppBarStateLoading();
    appBarController
        .listen((state) => expect(state, isInstanceOf<AppBarStateLoading>()));
  });
}
