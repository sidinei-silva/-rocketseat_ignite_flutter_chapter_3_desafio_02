import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/pages/login/login_controller.dart';
import 'package:split_it/pages/login/login_service.dart';
import 'package:split_it/pages/login/login_state.dart';
import 'package:split_it/pages/login/models/user_model.dart';

class LoginServiceMock extends Mock implements LoginService {}

void main() {
  late LoginController loginController;
  late LoginService loginService;

  setUp(() {
    loginService = LoginServiceMock();

    loginController = LoginController(
      onUpdate: () {},
      loginService: loginService,
    );
  });

  test("Testando o Google SignIn - Retornando sucesso", () async {
    expect(loginController.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    loginController.listen((state) => states.add(state));

    when(loginService.googleSignIn)
        .thenAnswer((_) async => UserModel(email: "email", id: "id"));

    await loginController.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 2);
  });

  test("Testando o Google SignIn - Retornando falha", () async {
    expect(loginController.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    loginController.listen((state) => states.add(state));

    when(loginService.googleSignIn).thenThrow("Deu error");

    await loginController.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect((states[1] as LoginStateFailure).message, "Deu error");
    expect(states.length, 2);
  });

  test("Testando o método listen", () async {
    loginController.state = LoginStateLoading();
    loginController
        .listen((state) => expect(state, isInstanceOf<LoginStateLoading>()));
    loginController.update();
  });

  test("Testando o método update", () async {
    loginController.state = LoginStateLoading();
    loginController
        .listen((state) => expect(state, isInstanceOf<LoginStateLoading>()));
    loginController.update();
  });
}
