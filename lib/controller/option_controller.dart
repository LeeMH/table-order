import 'package:get/get.dart';
import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/repository/option_repo.dart';

class OptionController extends GetxController {
  static OptionController get to => Get.find();
  final OptionRepo optionRepo = OptionRepo();

  final _options = RxList<Option>(<Option>[]);

  Future<void> initState(int merchantId, int branchId) async {
    var options = await optionRepo.fetchOptions(merchantId, branchId);
    _options.clear();
    _options.addAll(options);
    update();
  }

  void initOptions(List<Option> values) {
    _options.clear();
    _options.addAll(values);
    update();
  }

  List<Option> getOptions(List<int> values) {
    return _options.where((o) => values.contains(o.id)).toList();
  }
}
