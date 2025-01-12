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
              description TEXT,
              value_planned REAL,
              expense_day_of_the_month INT,
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
              income_day INT,
              FOREIGN KEY (user_id) REFERENCES USER (id)
            )
          ''');

          // Insert initial data
          await db.insert('USER', {
            'id': '1',
            'name': 'John Doe',
            'email': 'john.doe@example.com',
            'created_at': DateTime.now().toIso8601String(),
            'is_active': 1,
          });

          // Insert initial planned expenses
          List<Map<String, dynamic>> plannedExpenses = [
            {'id': '1', 'user_id': '1', 'expense_category': '', 'description': 'Home', 'value_planned': 524.87, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '2', 'user_id': '1', 'expense_category': '', 'description': 'Condomínio', 'value_planned': 28.11, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '3', 'user_id': '1', 'expense_category': '', 'description': 'Seguro Multi Riscos', 'value_planned': 14.75, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '4', 'user_id': '1', 'expense_category': '', 'description': 'Seguro Habitação', 'value_planned': 46.46, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '5', 'user_id': '1', 'expense_category': '', 'description': 'Internet | Tel G | Tel P', 'value_planned': 89.87, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '6', 'user_id': '1', 'expense_category': '', 'description': 'Nabu Casa', 'value_planned': 7.5, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '7', 'user_id': '1', 'expense_category': '', 'description': 'Kempo', 'value_planned': 25.0, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '8', 'user_id': '1', 'expense_category': '', 'description': 'Supermercados', 'value_planned': 133.0, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '9', 'user_id': '1', 'expense_category': '', 'description': 'Disney Plus', 'value_planned': 10.99, 'expense_day_of_the_month': 6, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '10', 'user_id': '1', 'expense_category': '', 'description': 'Netflix', 'value_planned': 10.43, 'expense_day_of_the_month': 21, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '11', 'user_id': '1', 'expense_category': '', 'description': 'Max', 'value_planned': 7.99, 'expense_day_of_the_month': 28, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '12', 'user_id': '1', 'expense_category': '', 'description': 'CrunchRoll', 'value_planned': 4.99, 'expense_day_of_the_month': 9, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '13', 'user_id': '1', 'expense_category': '', 'description': 'Ginásio', 'value_planned': 37.88, 'expense_day_of_the_month': 2, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '14', 'user_id': '1', 'expense_category': '', 'description': 'Maquina de Lavar Loiça', 'value_planned': 17.11, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '15', 'user_id': '1', 'expense_category': '', 'description': 'Nespresso', 'value_planned': 50.0, 'expense_day_of_the_month': 21, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '16', 'user_id': '1', 'expense_category': '', 'description': 'Apple Watch', 'value_planned': 9.0, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '17', 'user_id': '1', 'expense_category': '', 'description': 'Unha', 'value_planned': 25.0, 'expense_day_of_the_month': 1, 'can_fluctuate': 0, 'payment_method': 'Credit Card'},
            {'id': '18', 'user_id': '1', 'expense_category': '', 'description': 'Eletricidade', 'value_planned': 150.0, 'expense_day_of_the_month': 13, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '19', 'user_id': '1', 'expense_category': '', 'description': 'Água', 'value_planned': 27.0, 'expense_day_of_the_month': 22, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '20', 'user_id': '1', 'expense_category': '', 'description': 'NuBank - Crédito', 'value_planned': 48.85, 'expense_day_of_the_month': 2, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '21', 'user_id': '1', 'expense_category': '', 'description': 'Activo - Crédito', 'value_planned': 0.0, 'expense_day_of_the_month': 8, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '22', 'user_id': '1', 'expense_category': '', 'description': 'Supermercado', 'value_planned': 300.0, 'expense_day_of_the_month': 8, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '23', 'user_id': '1', 'expense_category': '', 'description': 'Nenéns', 'value_planned': 13.95, 'expense_day_of_the_month': 18, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '24', 'user_id': '1', 'expense_category': '', 'description': 'Bobeiras', 'value_planned': 150.0, 'expense_day_of_the_month': 15, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '25', 'user_id': '1', 'expense_category': '', 'description': 'Elegoo', 'value_planned': 179.67, 'expense_day_of_the_month': 11, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '26', 'user_id': '1', 'expense_category': '', 'description': 'Amazon Prime', 'value_planned': 49.9, 'expense_day_of_the_month': 23, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '27', 'user_id': '1', 'expense_category': '', 'description': 'UpWork', 'value_planned': 23.68, 'expense_day_of_the_month': 1, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
            {'id': '28', 'user_id': '1', 'expense_category': '', 'description': 'iPhone', 'value_planned': 290.25, 'expense_day_of_the_month': 5, 'can_fluctuate': 1, 'payment_method': 'Credit Card'},
          ];

          for (var expense in plannedExpenses) {
            await db.insert('PLANNED_EXPENSE', expense);
          }

          await db.insert('INCOME', {
            'id': '1',
            'user_id': '1',
            'value': 2000.0,
            'income_day': 1,
          });
        },
      );
    } catch (e) {
      // Handle database initialization error
      rethrow;
    }
  }
}