import 'package:get/get.dart';
import 'package:table_order/controller/models/option_group.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  final _qtt = 1.obs;
  final _options = RxList<int>([]);
  final _memo = ''.obs;

  int getQtt() => _qtt.value;
  List<int> getOptions() => _options;
  String getMemo() => _memo.value;

  void clear() {
    _qtt.value = 1;
    _options.clear();
    _memo.value = '';
    update();
  }

  void plusQtt(int maxQtt) {
    if (_qtt >= maxQtt) {
      return;
    }
    _qtt.value += 1;
    update();
  }

  void minusQtt() {
    if (_qtt.value == 1) {
      return;
    }
    _qtt.value -= 1;
    update();
  }

  void updateOption(int val, OptionGroup option) {
    /*
    int selected = Util.countSameElements(relatedOptions, _options.toList());

    // 최대, 최소 1개이면 flip 효과를 내기 위해 선택된 모든값을 제거
    if (option.minPick == 1 && option.maxPick == 1) {
      relatedOptions.where((e) => e != val).forEach((e) {
        _options.remove(e);
      });
    }

    // 최대 선택 갯수를 넘어가면 return
    if (selected >= option.maxPick &&
        option.maxCount > 1 &&
        !_options.contains(val)) return;

    if (_options.contains(val)) {
      _options.remove(val);
    } else {
      _options.add(val);
    }
    update();
    */
  }

  bool isSelectedOption(int val) {
    return _options.contains(val);
  }

  void updateMemo(String val) {
    _memo.value = val;
    update();
  }
}
