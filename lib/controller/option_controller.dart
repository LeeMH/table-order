import 'package:get/get.dart';
import 'package:table_order/controller/models/option.dart';

class OptionState extends GetxController {
  static OptionState get to => Get.find();

  final _options = RxList<Option>(<Option>[]);

  void initOptions(List<Option> values) {
    _options.clear();
    _options.addAll(values);
    update();
  }

  List<Option> getOption(List<int> values) {
    return _options.where((o) => values.contains(o.id)).toList();
  }
}
