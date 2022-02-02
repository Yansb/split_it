import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/models/item_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  final FirebaseRepository repository;
  _CreateSplitControllerBase({required this.repository});

  @observable
  EventModel event = EventModel();

  @observable
  int currentPage = 0;

  @action
  void nextPage() {
    if (currentPage < 3) {
      currentPage++;
    }
  }

  @action
  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @computed
  bool get enableNavigateButton {
    if (event.name.isNotEmpty && currentPage == 0) {
      return true;
    } else if (event.friends.isNotEmpty && currentPage == 1) {
      return true;
    } else if (event.items.isNotEmpty && currentPage == 2) {
      return true;
    } else {
      return false;
    }
  }

  @action
  void onChanged({
    String? name,
    List<ItemModel>? items,
    List<FriendModel>? friends,
  }) {
    event = event.copyWith(name: name, items: items, friends: friends);
  }

  @observable
  String status = "empty";

  @action
  Future<void> saveEvent() async {
    try {
      status = "loading";
      final response = await repository.create(event);
      status = "success";
      nextPage();
    } catch (e) {
      status = "error";
    }
  }
}
