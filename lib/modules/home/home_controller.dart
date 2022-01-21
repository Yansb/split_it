import 'package:flutter/scheduler.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeController {
  late HomeRepository repository;
  final List<EventModel> events = [];
  HomeController() {
    repository = HomeRepositoryMock();
  }

  getEvents(VoidCallback onUpdate) async {
    final response = await repository.getEvents();
    events.addAll(response);
    onUpdate();
  }
}
