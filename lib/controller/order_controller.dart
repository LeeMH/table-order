import 'package:get/get.dart';
import 'package:table_order/controller/models/item.dart';
import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_group.dart';
import 'package:table_order/controller/models/option_group_and_options.dart';
import 'package:table_order/controller/models/order.dart';
import 'package:table_order/controller/repository/option_repo.dart';
import 'package:table_order/controller/repository/order_repo.dart';
import 'package:table_order/util.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  OrderRepo orderRepo = OrderRepo();
  OptionRepo optionRepo = OptionRepo();

  late Item _item;

  final _qtt = 1.obs;
  final _pickOptions = RxMap<OptionGroup, List<Option>>({});
  final _totalPrice = 0.obs;

  Item getItem() => _item;
  int getQtt() => _qtt.value;
  Map<OptionGroup, List<Option>> getPickOptions() => _pickOptions;
  int getTotalPrice() => _totalPrice.value;

  void init(Item item) {
    _item = item;
    _totalPrice.value = item.price;
    _qtt.value = 1;
    _pickOptions.clear();
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

  void initDefaultOptions(Map<OptionGroup, List<Option>> options) {
    _pickOptions.addAll(options);
    update();
  }

  void updateOption(OptionGroup optionGroup, Option option) async {
    var relatedOptions =
        await optionRepo.getOptionsByOptionGroupId(optionGroup.id);
    List<Option> pickedOption = _pickOptions.putIfAbsent(optionGroup, () => []);

    int pickedCount = Util.countSameElements(relatedOptions, pickedOption);

    if (optionGroup.minPick == 1 && optionGroup.maxPick == 1) {
      // 1개 선택인경우
      relatedOptions.where((o) => o.id != option.id).forEach((o) {
        if (pickedOption.contains(o)) {
          _pickOptions.remove(o);
          _totalPrice.value -= o.price * _qtt.value;
        }
      });
      pickedOption.add(option);
      _totalPrice.value += option.price * _qtt.value;
    } else {
      // 최대 수량 초과인경우 제거만 가능
      if (pickedCount >= optionGroup.maxPick) {
        if (pickedOption.contains(option)) {
          pickedOption.remove(option);
          _totalPrice.value -= option.price * _qtt.value;
        } else {
          return;
        }
      } else {
        if (pickedOption.contains(option)) {
          pickedOption.remove(option);
          _totalPrice.value -= option.price * _qtt.value;
        } else {
          pickedOption.add(option);
          _totalPrice.value += option.price * _qtt.value;
        }
      }
    }
    _pickOptions[optionGroup] = pickedOption;
    update();
  }

  bool isPickedOption(OptionGroup optionGroup, Option val) {
    return _pickOptions[optionGroup]?.contains(val) ?? false;
  }

  Future<void> addOrder() async {
    List<OptionGroupAndPickOptions> options = [];

// 반복문을 통해 추가
    for (var entry in _pickOptions.entries) {
      options.add(
        OptionGroupAndPickOptions(
          optionGroup: entry.key,
          pickOptions: entry.value,
        ),
      );
    }

    var order = Order(
      item: _item,
      qtt: _qtt.value,
      total: _totalPrice.value,
      pickOptions: options,
    );
    orderRepo.addOrder(order);
  }
}
