import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/login_service.dart';
import 'package:split_it/modules/login/login_state.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  final LoginService service;
  VoidCallback onUpdate;
  Function(LoginState state)? onChange;

  LoginController({required this.onUpdate, required this.service});

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();
      final user = await service.googleSignIn();
      state = LoginStateSuccess(user: user);
      update();
    } catch (e) {
      state = LoginStateFailure(message: e.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    onChange?.call(state);
  }

  void listen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
