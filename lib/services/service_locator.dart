import 'package:get_it/get_it.dart';
import 'database_service.dart';
import '../dao/user_dao.dart';
import '../dao/planned_expense_dao.dart';
import '../dao/income_dao.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
  getIt.registerLazySingleton<UserDao>(() => UserDao());
  getIt.registerLazySingleton<PlannedExpenseDao>(() => PlannedExpenseDao());
  getIt.registerLazySingleton<IncomeDao>(() => IncomeDao());
}