import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/shared/models/event_model.dart';

import 'home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<DashboardModel> getDashboard() async {
    await Future.delayed(const Duration(seconds: 1));

    return DashboardModel(receive: 100, send: 50);
  }

  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 100,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 100,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 100,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 50,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: -100,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: -100,
      )
    ];
  }
}
