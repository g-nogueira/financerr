import 'package:sqflite/sqflite.dart';
import '../services/database_service.dart';
import '../models/user.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class UserDao {
  final DatabaseService _databaseService = getIt<DatabaseService>();

  Future<void> insertUser(User user) async {
    final db = await _databaseService.database;
    await db.insert('USER', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> getUsers() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('USER');
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }
}