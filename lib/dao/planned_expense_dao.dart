import 'package:sqflite/sqflite.dart';
import '../services/database_service.dart';
import '../models/planned_expense.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class PlannedExpenseDao {
  final DatabaseService _databaseService = getIt<DatabaseService>();

  Future<void> insertPlannedExpense(PlannedExpense plannedExpense) async {
    final db = await _databaseService.database;
    await db.insert('PLANNED_EXPENSE', plannedExpense.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<PlannedExpense>> getPlannedExpenses() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('PLANNED_EXPENSE');
    return List.generate(maps.length, (i) {
      return PlannedExpense.fromMap(maps[i]);
    });
  }

  Future<void> updatePlannedExpense(PlannedExpense plannedExpense) async {
    final db = await _databaseService.database;
    await db.update('PLANNED_EXPENSE', plannedExpense.toMap(), where: 'id = ?', whereArgs: [plannedExpense.id]);
  }
}