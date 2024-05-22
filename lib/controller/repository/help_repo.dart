import 'package:table_order/controller/models/help.dart';
import 'package:table_order/controller/repository/database.dart';

class HelpRepo {
  Future<List<Help>> fetchHelps() async {
    try {
      final db = await DataBase().database;
      List<Map> rows =
          await db.rawQuery('SELECT * FROM helps ORDER BY order_value');

      return Future(() {
        return rows.map((e) => Help(id: e['id'], title: e['title'])).toList();
      });
    } catch (e) {
      print('Error fetching helps: $e');
      return [];
    }
  }
}
