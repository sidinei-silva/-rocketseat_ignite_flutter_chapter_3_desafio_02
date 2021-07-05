import 'package:mobx/mobx.dart';
import 'package:split_it/pages/login/login_service.dart';
import 'package:split_it/pages/login/login_state.dart';

class LoginController {
  final LoginService loginService;
  final _state = Observable<LoginState>(LoginStateEmpty());

  LoginState get state => this._state.value;
  set state(LoginState state) => _state.value = state;

  LoginController({
    required this.loginService,
  });

  void update(LoginState state) {
    var action = Action(() {
      this.state = state;
    });

    action();
  }

  Future<void> googleSignIn() async {
    try {
      update(LoginStateLoading());
      final user = await loginService.googleSignIn();
      update(LoginStateSuccess(user: user));
    } catch (error) {
      update(
        LoginStateFailure(
          message: error.toString(),
        ),
      );
    }
  }
}
