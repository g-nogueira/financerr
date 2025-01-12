import 'package:sqflite/sqflite.dart';
import '../services/database_service.dart';
import '../models/income.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class IncomeDao {
  final DatabaseService _databaseService = getIt<DatabaseService>();

  Future<void> insertIncome(Income income) async {
    final db = await _databaseService.database;
    await db.insert('INCOME', income.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Income>> getIncomes() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('INCOME');
    return List.generate(maps.length, (i) {
      return Income.fromMap(maps[i]);
    });
  }
}