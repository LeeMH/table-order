import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_item.dart';

class OptionRepo {
  Future<List<Option>> fetchOptions(int merchantId, int branchId) async {
    return Future(() {
      return [
        Option(id: 1, title: "사이즈", minCount: 1, maxCount: 1, items: [
          OptionItem(id: 1, title: "Small", price: 0, defChoice: true),
          OptionItem(id: 2, title: "Medium", price: 2000, defChoice: false),
          OptionItem(id: 3, title: "Large", price: 3000, defChoice: false),
        ]),
        Option(id: 2, title: "토핑", minCount: 0, maxCount: 3, items: [
          OptionItem(id: 4, title: "치즈", price: 1000, defChoice: false),
          OptionItem(id: 5, title: "버섯", price: 1000, defChoice: false),
          OptionItem(id: 6, title: "올리브", price: 500, defChoice: false),
          OptionItem(id: 7, title: "소시지", price: 1500, defChoice: false),
          OptionItem(id: 8, title: "야채", price: 1200, defChoice: false),
        ]),
        Option(id: 3, title: "얼음", minCount: 0, maxCount: 1, items: [
          OptionItem(id: 9, title: "필요없음", price: 0, defChoice: true),
          OptionItem(id: 10, title: "필요", price: 0, defChoice: false),
        ]),
        Option(id: 4, title: "맵기", minCount: 0, maxCount: 1, items: [
          OptionItem(id: 11, title: "보통", price: 0, defChoice: true),
          OptionItem(id: 12, title: "매콤한맛", price: 0, defChoice: false),
          OptionItem(id: 13, title: "매운맛", price: 0, defChoice: false),
        ]),
        Option(id: 4, title: "제공사이드", minCount: 0, maxCount: 3, items: [
          OptionItem(id: 14, title: "단무지", price: 0, defChoice: false),
          OptionItem(id: 15, title: "피클", price: 0, defChoice: false),
          OptionItem(id: 16, title: "할리피뇨", price: 0, defChoice: false),
        ]),
      ];
    });
  }
}
