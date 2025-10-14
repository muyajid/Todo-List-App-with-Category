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
    final path = join(dbPath, 'todo.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, category TEXT, is_done INTEGER NOT NULL DEFAULT 0)',
        );
      },
    );
  }

  Future<int> insertTodo(Map<String, dynamic> todo) async {
    final client = await db;
    return await client.insert('todos', todo);
  }

  Future<List<Map<String, dynamic>>> getTodosActive() async {
    final client = await db;
    return client.query(
      'todos',
      where: 'is_done = ?',
      whereArgs: [0],
      orderBy: 'id ASC',
    );
  }

  Future<List<Map<String, dynamic>>> getTodosHistory() async {
    final client = await db;
    return client.query(
      'todos',
      where: 'is_done = ?',
      whereArgs: [1],
      orderBy: 'id ASC',
    );
  }

  Future<int> markDone(int id) async {
    final client = await db;
    return client.update(
      'todos',
      {'is_done': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
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
