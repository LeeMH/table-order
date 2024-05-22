import 'package:get/get.dart';
import 'package:table_order/controller/models/option_group.dart';
import 'package:table_order/controller/repository/option_repo.dart';
import 'package:table_order/util.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  OptionRepo optionRepo = OptionRepo();

  final _qtt = 1.obs;
  final _pickOptions = RxList<int>([]);
  final _memo = ''.obs;

  int getQtt() => _qtt.value;
  List<int> getPickOptions() => _pickOptions;
  String getMemo() => _memo.value;

  void clear() {
    _qtt.value = 1;
    _pickOptions.clear();
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

  void initDefaultOptions(List<int> options) {
    _pickOptions.addAll(options);
    update();
  }

  void updateOption(OptionGroup optionGroup, int optionId) async {
    var relatedOptions =
        await optionRepo.getOptionsByOptionGroupId(optionGroup.id);
    int pickedCount = Util.countSameElements(
        relatedOptions.map((o) => o.id).toList(), _pickOptions.toList());

    if (optionGroup.minPick == 1 && optionGroup.maxPick == 1) {
      // 1개 선택인경우
      relatedOptions.where((o) => o.id != optionId).forEach((o) {
        _pickOptions.remove(o.id);
      });
      _pickOptions.add(optionId);
    } else {
      // 최대 수량 초과인경우 제거만 가능
      if (pickedCount >= optionGroup.maxPick) {
        if (_pickOptions.contains(optionId)) {
          _pickOptions.remove(optionId);
        } else {
          return;
        }
      } else {
        if (_pickOptions.contains(optionId)) {
          _pickOptions.remove(optionId);
        } else {
          _pickOptions.add(optionId);
        }
      }
    }
    update();
  }

  bool isPickedOption(int val) {
    return _pickOptions.contains(val);
  }

  void updateMemo(String val) {
    _memo.value = val;
    update();
  }
}
