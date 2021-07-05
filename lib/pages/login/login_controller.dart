import 'package:mobx/mobx.dart';
import 'package:split_it/pages/login/login_service.dart';
import 'package:split_it/pages/login/login_state.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginService loginService;

  _LoginControllerBase({
    required this.loginService,
  });

  @observable
  LoginState state = LoginStateEmpty();

  @action
  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      final user = await loginService.googleSignIn();
      state = LoginStateSuccess(user: user);
    } catch (error) {
      state = LoginStateFailure(
        message: error.toString(),
      );
    }
  }
}
