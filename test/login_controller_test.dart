import 'package:flutter_test/flutter_test.dart';
import 'package:split_it/pages/login/login_controller.dart';
import 'package:split_it/pages/login/login_service.dart';
import 'package:split_it/pages/login/login_state.dart';
import 'package:split_it/pages/login/models/user_model.dart';

class LoginServiceMock implements LoginService {
  @override
  Future<UserModel> googleSignIn() async {
    return UserModel(
      email: "sidinei.silva02@gmail.com",
      id: "id",
    );
  }
}

void main() {
  late LoginController loginController;

  setUp(() {
    loginController =
        LoginController(onUpdate: () {}, loginService: LoginServiceMock());
  });

  test("Testando o Google SignIn - Retornando sucesso", () async {
    expect(loginController.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    loginController.listen((state) => states.add(state));
    await loginController.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 2);
  });
}
