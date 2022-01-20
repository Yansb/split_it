import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/login/login_controller.dart';
import 'package:split_it/modules/login/login_service.dart';
import 'package:split_it/modules/login/login_state.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class LoginServiceMock extends Mock implements LoginService {}

void main() {
  late LoginController controller;
  late LoginService service;
  setUp(() {
    service = LoginServiceMock();
    controller = LoginController(onUpdate: () {}, service: service);
  });

  test('Testing Google sign in returning success', () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    controller.listen((state) => states.add(state));
    when(service.googleSignIn)
        .thenAnswer((_) async => UserModel(email: "email", id: "id"));
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 2);
  });

  test('Testing Google sign in returning failure', () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    controller.listen((state) => states.add(state));
    when(service.googleSignIn).thenThrow("Could not sign in with Google");
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect((states[1] as LoginStateFailure).message,
        "Could not sign in with Google");
    expect(states.length, 2);
  });

  test("Listen and update method", () async {
    controller.state = LoginStateLoading();
    controller
        .listen((state) => expect(state, isInstanceOf<LoginStateLoading>()));
    controller.update();
  });
}
