import 'package:flutter/material.dart';

import 'package:split_it/pages/login/login_service.dart';
import 'package:split_it/pages/login/login_state.dart';

import 'models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;
  final LoginService loginService;
  Function(LoginState state)? onChange;

  LoginController({
    this.user,
    required this.onUpdate,
    required this.loginService,
  });

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();
      final user = await loginService.googleSignIn();
      state = LoginStateSuccess(user: user);
      update();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(state);
    }
  }

  void listen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
