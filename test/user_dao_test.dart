import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:financerr/dao/user_dao.dart';
import 'package:financerr/models/user.dart';
import 'package:financerr/services/database_service.dart';

void main() {
  final getIt = GetIt.instance;

  setUp(() {
    getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
    getIt.registerLazySingleton<UserDao>(() => UserDao());
  });

  tearDown(() {
    getIt.reset();
  });

  test('insert and retrieve user', () async {
    final userDao = getIt<UserDao>();
    final user = User(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      createdAt: DateTime.now(),
      isActive: true,
    );

    await userDao.insertUser(user);
    final users = await userDao.getUsers();

    expect(users.length, 1);
    expect(users.first.name, 'John Doe');
  });
}