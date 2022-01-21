import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';
import 'package:split_it/shared/models/event_model.dart';

class AppBarRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late AppBarController controller;
  late HomeRepository repository;
  setUp(() {
    repository = AppBarRepositoryMock();
    controller = AppBarController(repository: repository);
  });

  test('get dashboard returning success', () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    controller.listen((state) => states.add(state));
    when(repository.getDashboard)
        .thenAnswer((_) async => DashboardModel(receive: 100, send: 50));
    await controller.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateSuccess>());
    expect(states.length, 2);
  });

  test('get dashboard returning failure', () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    controller.listen((state) => states.add(state));
    when(repository.getDashboard).thenThrow("Error");
    await controller.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateFailure>());
    expect((states[1] as AppBarStateFailure).message, "Error");
    expect(states.length, 2);
  });
}
