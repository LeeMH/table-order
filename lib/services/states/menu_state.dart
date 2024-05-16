import 'package:get/get.dart';
import 'package:table_order/services/models/menu.dart';

class MenuState extends GetxController {
  static MenuState get to => Get.find();

  final _menu = RxList<Menu>(<Menu>[]);
  final _selected = RxInt(-1);

  void initMenu(List<Menu> values) {
    _menu.clear();
    _menu.addAll(values);
    update();
  }

  List<Menu> getMenuBySelectedGroupId(int value) {
    return _menu.where((m) => m.groups.contains(value)).toList();
  }

  void updateSelectedMenu(int value) {
    _selected.value = value;
    update();
  }

  int getSelectedMenuId() {
    return _selected.value;
  }
}
