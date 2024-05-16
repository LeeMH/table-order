import 'package:get/get.dart';
import 'package:table_order/services/models/group.dart';

class GroupState extends GetxController {
  static GroupState get to => Get.find();

  final _groups = RxList<Group>(<Group>[]);
  final _selected = RxInt(-1);

  void initGroups(List<Group> values) {
    _groups.clear();
    _groups.addAll(values);
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
