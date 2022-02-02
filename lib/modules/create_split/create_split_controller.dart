import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/models/item_model.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  @observable
  String eventName = "";

  @observable
  List<FriendModel> selectedFriends = [];

  @observable
  int currentPage = 0;

  @action
  void nextPage() {
    if (currentPage < 2) {
      currentPage++;
    }
  }

  @action
  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @observable
  List<ItemModel> items = <ItemModel>[];

  @computed
  bool get enableNavigateButton {
    if (eventName.isNotEmpty && currentPage == 0) {
      return true;
    } else if (selectedFriends.isNotEmpty && currentPage == 1) {
      return true;
    } else if (items.isNotEmpty && currentPage == 2) {
      return true;
    } else {
      return false;
    }
  }

  @action
  void setSelectedFriends(List<FriendModel> list) {
    selectedFriends = list;
  }

  @action
  setItems(List<ItemModel> list) {
    items = list;
  }

  @action
  void setEventName(String name) {
    eventName = name;
  }
}
