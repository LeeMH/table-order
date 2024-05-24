import 'dart:convert';

import 'package:table_order/controller/models/order.dart';
import 'package:table_order/controller/repository/database.dart';

class OrderRepo {
  Future<List<Order>> getOrders() async {
    try {
      final db = await DataBase().database;

      var rows = await db.query('orders');
      return rows
          .map((row) => Order.fromJson(jsonDecode(row['json_data'] as String)))
          .toList();
    } catch (e) {
      print('Error fetching orders: $e');
      return [];
    }
  }

  Future<void> addOrder(Order order) async {
    try {
      final db = await DataBase().database;

      final orderMap = {
        'status': 'ADDED',
        'json_data': jsonEncode(order.toJson()),
        'created_at': DateTime.now().millisecondsSinceEpoch,
      };

      db.insert('orders', orderMap);
    } catch (e) {
      print('Error adding orders: $e');
    }
  }
}
