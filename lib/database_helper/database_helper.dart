import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cart.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE Cart(id INTEGER PRIMARY KEY, title TEXT, description TEXT, price TEXT, percent TEXT, image TEXT)');
  }

  Future<int> saveItem(Map<String, dynamic> item) async {
    var dbClient = await db;
    var result = await dbClient.insert("Cart", item);
    return result;
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    var dbClient = await db;
    var result = await dbClient.query("Cart");
    return result;
  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return await dbClient.delete("Cart", where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllItems() async {
    var dbClient = await db;
    return await dbClient.delete("Cart");
  }
}
