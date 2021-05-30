import 'package:flutter/material.dart';

import 'package:split_it/pages/login/login_service.dart';
import 'package:split_it/pages/login/login_state.dart';

import 'models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;
  final LoginService loginService;

  LoginController({
    this.user,
    required this.onUpdate,
    required this.loginService,
  });

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      onUpdate();
      user = await loginService.googleSignIn();
      state = LoginStateSuccess(user: user!);
      onUpdate();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      onUpdate();
    }
  }
}
