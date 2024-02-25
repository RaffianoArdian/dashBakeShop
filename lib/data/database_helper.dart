import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:dashboard/data/shop_item_data.dart';

class DbHelper {
  static Database? _database;

  static Future<void> initDb() async {
    if (_database != null) return;

    try {
      print("trying creating database");
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'shopItem.db');

      _database = await openDatabase(path, version: 1, onCreate: _createDb);
    } catch (e) {
      print('Error initializing database: $e');
    }
  }

  static void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE shopItem(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title STRING,
        description STRING,
        image STRING,
        price STRING,
        isLiked INTEGER
      )
    ''');
  }

  static Future<void> initializeWithData() async {
    try {
      await insertShopItem(shopItem1.toMap());
      await insertShopItem(shopItem2.toMap());
      await insertShopItem(shopItem3.toMap());
      await insertShopItem(shopItem4.toMap());
      await insertShopItem(shopItem5.toMap());
      await insertShopItem(shopItem6.toMap());
    } catch (e) {
      print('Error initializing database with data: $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getShopItem() async {
    final db = await _database;
    return db!.query('shopItem');
  }

  static Future<int> insertShopItem(Map<String, dynamic> shopItem) async {
    final db = await _database;
    List<Map<String, dynamic>> existingItem = await db!.query('shopItem', where: 'id = ?', whereArgs: [shopItem['id']]);
    if (existingItem.isEmpty) {
      return db.insert('shopItem', shopItem);
    } else {
      print('Item with id ${shopItem['id']} already exists.');
      return -1; // Or handle the duplicate id case as needed
    }
  }

  static Future<int> updateShopItem(Map<String, dynamic> shopItem) async {
    final db = await _database;
    return db!.update('ShopItem', shopItem, where: 'id = ?', whereArgs: [shopItem['id']]);
  }

  static Future<int> deleteNote(int id) async {
    final db = await _database;
    return db!.delete('Notes', where: 'id = ?', whereArgs: [id]);
  }
}
