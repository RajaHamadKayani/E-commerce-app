import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperPurchaseItem {
  static final DatabaseHelperPurchaseItem _instance =
      DatabaseHelperPurchaseItem.internal();
  factory DatabaseHelperPurchaseItem() => _instance;
  static Database? _db;

  DatabaseHelperPurchaseItem.internal();

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'purchase.db');

    var db = await openDatabase(path, version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE Purchase(id INTEGER PRIMARY KEY, title TEXT, description TEXT, price TEXT, percent TEXT, image TEXT, email TEXT, pincode TEXT, address TEXT, city TEXT, state TEXT, country TEXT, account TEXT, name TEXT, ifsc TEXT, quantity TEXT, size TEXT)');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _addColumnIfNotExists(db, 'Purchase', 'quantity', 'TEXT');
      await _addColumnIfNotExists(db, 'Purchase', 'size', 'TEXT');
    }
  }

  Future<void> _addColumnIfNotExists(Database db, String tableName, String columnName, String columnType) async {
    var result = await db.rawQuery('PRAGMA table_info($tableName)');
    bool exists = result.any((column) => column['name'] == columnName);
    if (!exists) {
      await db.execute('ALTER TABLE $tableName ADD COLUMN $columnName $columnType');
    }
  }

  Future<int> saveItem(Map<String, dynamic> item) async {
    var dbClient = await db;
    var result = await dbClient.insert("Purchase", item);
    return result;
  }

  Future<List<Map<String, dynamic>>> getPurchaseItems() async {
    var dbClient = await db;
    var result = await dbClient.query("Purchase");
    return result;
  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return await dbClient.delete("Purchase", where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllItems() async {
    var dbClient = await db;
    return await dbClient.delete("Purchase");
  }
}
