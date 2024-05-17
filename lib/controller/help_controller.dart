import 'package:get/get.dart';
import 'package:table_order/controller/models/help.dart';
import 'package:table_order/controller/repository/help_repo.dart';

class HelpController extends GetxController {
  static HelpController get to => Get.find();
  final HelpRepo helpRepo = HelpRepo();

  // state
  final _helps = RxList<Help>(<Help>[]);

  Future<void> initState(int merchantId, int branchId) async {
    var helps = await helpRepo.fetchHelps(merchantId, branchId);
    _helps.clear();
    _helps.addAll(helps);
    update();
  }

  List<Help> getHelps() {
    return _helps.toList();
  }
}
