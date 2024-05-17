import 'package:get/get.dart';
import 'package:table_order/controller/models/item.dart';
import 'package:table_order/controller/repository/item_repo.dart';

class ItemController extends GetxController {
  static ItemController get to => Get.find();
  final ItemRepo itemRepo = ItemRepo();

  //state
  final _items = RxList<Item>(<Item>[]);
  final _selected = RxInt(-1);

  Future<void> initState(int merchantId, int branchId) async {
    var menu = await itemRepo.fetchItem(merchantId, branchId);
    _items.clear();
    _items.addAll(menu);
    update();
  }

  List<Item> getItemsBySelectedGroupId(int value) {
    return _items.where((m) => m.groups.contains(value)).toList();
  }

  void updateSelectedItem(int value) {
    _selected.value = value;
    update();
  }

  int getSelectedItemId() {
    return _selected.value;
  }

  Item getSelectedItem() {
    return _items.firstWhere((m) => m.id == _selected.value);
  }
}
