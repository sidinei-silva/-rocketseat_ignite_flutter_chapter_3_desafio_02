import 'package:mobx/mobx.dart';
import 'package:split_it/pages/create_split/create_split_controller.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/respositories/firebase_respository.dart';
part 'step_two_controller.g.dart';

class StepTwoController = _StepTwoControllerBase with _$StepTwoController;

abstract class _StepTwoControllerBase with Store {
  final CreateSplitController createSplitController;
  final repository = FirebaseRespository();

  _StepTwoControllerBase({required this.createSplitController}) {
    autorun((_) {
      createSplitController.setSelectedFriends(_selectedFriends);
    });
  }

  @observable
  List<FriendModel> _friends = [];

  @observable
  ObservableList<FriendModel> _selectedFriends = ObservableList.of([]);

  List<FriendModel> get selectFriends => _selectedFriends;

  @observable
  String search = "";

  @action
  void onChange(String value) {
    search = value;
  }

  @action
  void addFriends({required FriendModel friend}) {
    _selectedFriends.add(friend);
  }

  @action
  void removeFriends({required FriendModel friend}) {
    _selectedFriends.remove(friend);
  }

  @computed
  List<FriendModel> get items {
    if (_selectedFriends.isNotEmpty) {
      final filteredList = _friends.where((friend) {
        final validateName =
            friend.name.toString().toLowerCase().contains(search.toLowerCase());
        final notExistIsSelectdFriends = !_selectedFriends.contains(friend);

        return validateName && notExistIsSelectdFriends;
      }).toList();
      return filteredList;
    }

    if (search.isEmpty) {
      return _friends;
    } else {
      final filteredList = _friends
          .where(
            (friend) => friend.name
                .toString()
                .toLowerCase()
                .contains(search.toLowerCase()),
          )
          .toList();
      return filteredList;
    }
  }

  @action
  Future<void> getFriends() async {
    final response = await this.repository.get("/friends");
    _friends = response.map((e) => FriendModel.fromMap(e)).toList();
  }
}
