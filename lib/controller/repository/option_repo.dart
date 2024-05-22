import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_group.dart';
import 'package:table_order/controller/repository/database.dart';

class OptionRepo {
  Future<List<OptionGroup>> getOptionGroupsByItemId(int itemId) async {
    try {
      final db = await DataBase().database;
      final sql = '''
SELECT og.*
FROM  item_option_group iog
JOIN  option_groups og ON iog.option_group_id = og.id
WHERE iog.item_id = $itemId
ORDER BY og.order_value
''';

      List<Map> rows = await db.rawQuery(sql);
      return Future(() {
        return rows
            .map((e) => OptionGroup(
                  id: e['id'],
                  title: e['title'],
                  minPick: e['min_pick'],
                  maxPick: e['max_pick'],
                ))
            .toList();
      });
    } catch (e) {
      print('Error fetching options: $e');
      return [];
    }
  }

  Future<List<Option>> getOptionsByItemId(int itemId) async {
    try {
      final db = await DataBase().database;
      final sql = '''
SELECT o.*
FROM  item_option_group iog
JOIN  option_groups og ON iog.option_group_id = og.id
JOIN  options o ON og.id = o.option_group_id
WHERE iog.item_id = $itemId
ORDER BY o.order_value
''';

      List<Map> rows = await db.rawQuery(sql);
      return Future(() {
        return rows
            .map((e) => Option(
                  id: e['id'],
                  optionGroupId: e['option_group_id'],
                  title: e['title'],
                  price: e['price'],
                  defaultPick: e['default_pick'] == 1,
                ))
            .toList();
      });
    } catch (e) {
      print('Error fetching options: $e');
      return [];
    }
  }
}
