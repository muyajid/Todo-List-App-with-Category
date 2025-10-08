import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'contacts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, category TEXT)',
        );
      },
    );
  }

  Future<int> insertName(String name) async {
    final client = await db;
    return client.insert('contacts', {'name': name});
  }

  Future<List<Map<String, dynamic>>> getNames() async {
    final client = await db;
    return client.query('contacts', orderBy: 'id DESC');
  }

  Future<int> updateTodo(int id, Map<String, dynamic> todo) async {
    final client = await db;
    return await client.update('todos', todo, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTodo(int id) async {
    final client = await db;
    return await client.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
