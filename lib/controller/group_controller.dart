import 'package:get/get.dart';
import 'package:table_order/controller/models/group.dart';
import 'package:table_order/controller/repository/group_repo.dart';

class GroupController extends GetxController {
  static GroupController get to => Get.find();
  final GroupRepo groupRepo = GroupRepo();

  // state
  final _groups = RxList<Group>(<Group>[]);
  final _selected = RxInt(-1);

  Future<void> initState(int merchantId, int branchId) async {
    var groups = await groupRepo.fetchGroups(merchantId, branchId);
    _groups.clear();
    _groups.addAll(groups);
    _selected.value = _groups.first.id;
    update();
  }

  List<Group> getGroups() {
    return _groups.toList();
  }

  void updateSelectedGroup(int value) {
    _selected.value = value;
    update();
  }

  int getSelectedGroupId() {
    return _selected.value;
  }
}
