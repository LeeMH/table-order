import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_pick.dart';
import 'package:table_order/controller/repository/database.dart';

class OptionRepo {
  Future<List<Option>> getOptionsByItemId(int itemId) async {
    try {
      final db = await DataBase().database;
      final sql = '''
SELECT o.*
FROM  options o
JOIN  item_option io ON o.id = io.option_id
WHERE io.item_id = $itemId
ORDER BY o.order_value
''';

      List<Map> rows = await db.rawQuery(sql);
      return Future(() {
        return rows
            .map((e) => Option(
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

  Future<List<OptionPick>> getOptionPickByItemId(int itemId) async {
    try {
      final db = await DataBase().database;
      final sql = '''
SELECT op.*
FROM  option_pick op
JOIN  options o ON op.option_id = o.id
JOIN  item_option io ON o.id = io.option_id
WHERE io.item_id = $itemId
ORDER BY op.order_value
''';

      List<Map> rows = await db.rawQuery(sql);
      return Future(() {
        return rows
            .map((e) => OptionPick(
                  id: e['id'],
                  optionId: e['option_id'],
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
