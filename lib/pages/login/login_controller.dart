import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/pages/login/login_state.dart';

import 'models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();

  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      state = LoginStateLoading();
      final account = await _googleSignIn.signIn();
      user = UserModel.google(account!);
      state = LoginStateSuccess(user: user!);
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      print(error);
    }
  }
}
