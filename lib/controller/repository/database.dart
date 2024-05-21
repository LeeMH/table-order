import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:table_order/util/file.dart';

class DataBase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    await _open(); // 수정: _open() 메서드를 호출할 때 await 키워드를 사용하여 기다립니다.
    return _database!;
  }

  Future<void> _open() async {
    try {
      var file = await getFile('table/table.db');
      _database = await openDatabase(file.path);
    } catch (e) {
      print('Error opening database: $e');
    }
  }
}
