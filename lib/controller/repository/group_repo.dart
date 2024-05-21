import 'dart:async';

import 'package:table_order/controller/models/group.dart';
import 'package:table_order/controller/repository/database.dart';

class GroupRepo {
  Future<List<Group>> fetchGroups(int merchantId, int branchId) async {
    try {
      final db = await DataBase().database;
      List<Map> rows =
          await db.rawQuery('SELECT * FROM groups ORDER BY order_value');

      return Future(() {
        return rows.map((e) => Group(id: e['id'], title: e['title'])).toList();
      });
    } catch (e) {
      print('Error fetching groups: $e');
      return [];
    }
  }
}
