import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'app_database.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE USER (
              id TEXT PRIMARY KEY,
              name TEXT,
              email TEXT UNIQUE,
              created_at TEXT,
              is_active INTEGER
            )
          ''');
          await db.execute('''
            CREATE TABLE PLANNED_EXPENSE (
              id TEXT PRIMARY KEY,
              user_id TEXT,
              expense_category TEXT,
              value_planned REAL,
              expense_day TEXT,
              can_fluctuate INTEGER,
              payment_method TEXT,
              FOREIGN KEY (user_id) REFERENCES USER (id)
            )
          ''');
          await db.execute('''
            CREATE TABLE INCOME (
              id TEXT PRIMARY KEY,
              user_id TEXT,
              value REAL,
              income_day TEXT,
              FOREIGN KEY (user_id) REFERENCES USER (id)
            )
          ''');
        },
      );
    } catch (e) {
      // Handle database initialization error
      rethrow;
    }
  }
}