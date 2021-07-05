import 'package:mobx/mobx.dart';
import 'package:split_it/pages/login/login_service.dart';
import 'package:split_it/pages/login/login_state.dart';

class LoginController {
  final LoginService loginService;
  final _state = Observable<LoginState>(LoginStateEmpty());

  LoginState get state => this._state.value;
  set state(LoginState state) => _state.value = state;

  final _actionController = ActionController();

  LoginController({
    required this.loginService,
  });

  Future<void> googleSignIn() async {
    final actionName = "LoginController.googleSignIn";
    _actionController.startAction(name: actionName);
    final startTime = DateTime.now();

    try {
      state = LoginStateLoading();
      final user = await loginService.googleSignIn();
      state = LoginStateSuccess(user: user);
    } catch (error) {
      state = LoginStateFailure(
        message: error.toString(),
      );
    }
    _actionController.endAction(
      ActionRunInfo(
        name: actionName,
        startTime: startTime,
      ),
    );
  }
}
