import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/pages/home/home_controller.dart';
import 'package:split_it/pages/home/home_state.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeController homeController;
  late HomeRepository homeRepository;

  setUp(() {
    homeRepository = HomeRepositoryMock();

    homeController = HomeController(homeRepository: homeRepository);
  });

  test("Testando o GetEvents - Retornando sucesso", () async {
    expect(homeController.homeState, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];

    mobx.autorun((_) {
      states.add(homeController.homeState);
    });

    when(homeRepository.getEvents).thenAnswer((_) async => [
          EventModel(
            title: "title",
            date: DateTime.now(),
            money: 100,
            people: 5,
          )
        ]);

    await homeController.getEvents();
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateLoading>());
    expect(states[2], isInstanceOf<HomeStateSuccess>());
    expect(states.length, 3);
  });

  test("Testando o GetEvents - Retornando falha", () async {
    expect(homeController.homeState, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];

    mobx.autorun((_) => {states.add(homeController.homeState)});

    when(homeRepository.getEvents).thenThrow("Deu error");

    await homeController.getEvents();
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateFailure>());
    expect((states[1] as HomeStateFailure).message, "Deu error");
    expect(states.length, 2);
  });

  test("Testando o método listen", () async {
    homeController.homeState = HomeStateLoading();
    mobx.autorun(
      (_) => {
        expect(
          homeController.homeState,
          isInstanceOf<HomeStateLoading>(),
        )
      },
    );
  });
}
