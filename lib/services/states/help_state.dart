import 'package:get/get.dart';
import 'package:table_order/services/models/help.dart';

class HelpState extends GetxController {
  static HelpState get to => Get.find();

  final _helps = RxList<Help>(<Help>[]);

  void initHelps(List<Help> values) {
    _helps.clear();
    _helps.addAll(values);
    update();
  }

  List<Help> getHelp() {
    return _helps.toList();
  }
}
