import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
part 'checkbox_controller.g.dart';

class CheckboxController = _CheckboxControllerBase with _$CheckboxController;

enum ClassCheckboxStatus { empty, loading, unchecked, checked, error }

abstract class _CheckboxControllerBase with Store {
  late EventModel event;
  final FirebaseRepository repository;

  _CheckboxControllerBase({required this.repository, required this.event});

  @observable
  ClassCheckboxStatus status = ClassCheckboxStatus.empty;

  @action
  Future<void> update(FriendModel friend) async {
    try {
      status = ClassCheckboxStatus.loading;
      final friends = event.friends;
      final updatedFriendIndex =
          event.friends.indexWhere((element) => element == friend);
      final isPaid = !friends[updatedFriendIndex].isPaid;
      friends[updatedFriendIndex] =
          friends[updatedFriendIndex].copyWith(isPaid: isPaid);
      final newPaid =
          event.paid + (isPaid ? event.valueSplit : -event.valueSplit);
      event = event.copyWith(friends: friends, paid: newPaid);

      await repository.update(
          id: event.id, collection: '/events', model: event);
      if (isPaid) {
        status = ClassCheckboxStatus.checked;
      } else {
        status = ClassCheckboxStatus.unchecked;
      }
    } catch (e) {
      status = ClassCheckboxStatus.error;
    }
  }
}
