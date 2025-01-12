import 'package:financerr/dao/user_dao.dart';
import 'package:get_it/get_it.dart';
import 'database_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
  getIt.registerLazySingleton<UserDao>(() => UserDao());
}