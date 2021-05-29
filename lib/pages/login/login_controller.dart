import 'package:google_sign_in/google_sign_in.dart';

import 'models/user_model.dart';

class LoginController {
  Future<void> googleSignIn() async {
    UserModel? user;

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await _googleSignIn.signIn();
      user = UserModel.google(response!);
    } catch (error) {
      print(error);
    }
  }
}
