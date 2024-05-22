import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:table_order/controller/models/order.dart';
import 'package:table_order/controller/repository/database.dart';

class OrderRepo {
  Future<List<Order>> getOrders() async {
    try {
      throw Exception('Not implemented');
    } catch (e) {
      print('Error fetching orders: $e');
      return [];
    }
  }

/*
CREATE TABLE ORDERS (
    id INTEGER PRIMARY KEY,
    item_id INTEGER,
    price INTEGER,
    total INTEGER,
    created_at INTEGER
);

#########################
# ORDER_OPTIONS TABLE
#########################
DROP TABLE ORDER_OPTIONS;
CREATE TABLE ORDER_OPTIONS (
    id INTEGER PRIMARY KEY,
    order_id INTEGER,
    option_id INTEGER,
    price INTEGER,
    created_at INTEGER
);
*/
  Future<void> addOrder(Order order) async {
    final db = await DataBase().database;

    final orderMap = {
      'item_id': order.getItem().id,
      'qtt': order.getQtt(),
      'price': order.getItem().price,
      'total': order.getTotal(),
      'created_at': DateTime.now().millisecondsSinceEpoch,
    };

    await db.transaction((txn) async {
      // order 저장
      int orderId = await txn.insert('orders', orderMap);

      // option 저장
      order.getPickOptions().forEach((option) async {
        final optionMap = {
          'order_id': orderId,
          'option_id': option.id,
          'price': option.price,
          'created_at': DateTime.now().millisecondsSinceEpoch,
        };

        await txn.insert('order_options', optionMap);
      });
    });
  }
}
