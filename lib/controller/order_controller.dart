import 'package:get/get.dart';
import 'package:table_order/controller/models/item.dart';
import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_group.dart';
import 'package:table_order/controller/repository/option_repo.dart';
import 'package:table_order/util.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  OptionRepo optionRepo = OptionRepo();

  late Item _item;

  final _qtt = 1.obs;
  final _pickOptions = RxList<Option>([]);
  final _memo = ''.obs;
  final _totalPrice = 0.obs;

  Item getItem() => _item;
  int getQtt() => _qtt.value;
  List<Option> getPickOptions() => _pickOptions;
  String getMemo() => _memo.value;
  int getTotalPrice() => _totalPrice.value;

  void init(Item item) {
    _item = item;
    _totalPrice.value = item.price;
    _qtt.value = 1;
    _pickOptions.clear();
    _memo.value = '';
    update();
  }

  void plusQtt(int maxQtt) {
    if (_qtt >= maxQtt) {
      return;
    }
    // 한개당 가격
    var unitPrice = _totalPrice.value ~/ _qtt.value;
    _qtt.value += 1;
    _totalPrice.value += unitPrice;
    update();
  }

  void minusQtt() {
    if (_qtt.value == 1) {
      return;
    }

    // 한개당 가격
    var unitPrice = _totalPrice.value ~/ _qtt.value;
    _qtt.value -= 1;
    _totalPrice.value -= unitPrice;
    update();
  }

  void initDefaultOptions(List<Option> options) {
    _pickOptions.addAll(options);
    update();
  }

  void updateOption(OptionGroup optionGroup, Option option) async {
    var relatedOptions =
        await optionRepo.getOptionsByOptionGroupId(optionGroup.id);
    int pickedCount =
        Util.countSameElements(relatedOptions, _pickOptions.toList());

    if (optionGroup.minPick == 1 && optionGroup.maxPick == 1) {
      // 1개 선택인경우
      relatedOptions.where((o) => o.id != option.id).forEach((o) {
        if (_pickOptions.contains(o)) {
          _pickOptions.remove(o);
          _totalPrice.value -= o.price * _qtt.value;
        }
      });
      _pickOptions.add(option);
      _totalPrice.value += option.price * _qtt.value;
    } else {
      // 최대 수량 초과인경우 제거만 가능
      if (pickedCount >= optionGroup.maxPick) {
        if (_pickOptions.contains(option)) {
          _pickOptions.remove(option);
          _totalPrice.value -= option.price * _qtt.value;
        } else {
          return;
        }
      } else {
        if (_pickOptions.contains(option)) {
          _pickOptions.remove(option);
          _totalPrice.value -= option.price * _qtt.value;
        } else {
          _pickOptions.add(option);
          _totalPrice.value += option.price * _qtt.value;
        }
      }
    }
    update();
  }

  bool isPickedOption(Option val) {
    return _pickOptions.contains(val);
  }

  void updateMemo(String val) {
    _memo.value = val;
    update();
  }
}
