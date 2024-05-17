import 'package:get/get.dart';
import 'package:table_order/controller/models/help.dart';
import 'package:table_order/controller/repository/help_repo.dart';

class HelpController extends GetxController {
  static HelpController get to => Get.find();
  final HelpRepo helpRepo = HelpRepo();

  // state
  final _helps = RxList<Help>(<Help>[]);
  final _selected = RxList<int>(<int>[]);

  Future<void> initState(int merchantId, int branchId) async {
    var helps = await helpRepo.fetchHelps(merchantId, branchId);
    _helps.clear();
    _helps.addAll(helps);
    update();
  }

  List<Help> getHelps() {
    return _helps.toList();
  }

  List<int> getSelectedHelpIds() {
    return _selected.toList();
  }

  void updateSelectedHelpId(int value) {
    print("updateSelectedHelpId: $value, ${_selected.contains(value)}");
    if (_selected.contains(value)) {
      _selected.remove(value);
    } else {
      _selected.add(value);
    }
    update();
  }

  void clearSelectedHelpIds() {
    _selected.clear();
    update();
  }
}
