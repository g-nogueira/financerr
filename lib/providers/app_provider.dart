import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../dao/user_dao.dart';
import '../dao/planned_expense_dao.dart';
import '../dao/income_dao.dart';
import '../models/user.dart';
import '../models/planned_expense.dart';
import '../models/income.dart';

final getIt = GetIt.instance;

class AppProvider with ChangeNotifier {
  final UserDao _userDao = getIt<UserDao>();
  final PlannedExpenseDao _plannedExpenseDao = getIt<PlannedExpenseDao>();
  final IncomeDao _incomeDao = getIt<IncomeDao>();

  List<User> _users = [];
  List<User> get users => _users;

  List<PlannedExpense> _plannedExpenses = [];
  List<PlannedExpense> get plannedExpenses => _plannedExpenses;

  List<Income> _incomes = [];
  List<Income> get incomes => _incomes;

  Future<void> loadUsers() async {
    _users = await _userDao.getUsers();
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    await _userDao.insertUser(user);
    await loadUsers();
  }

  Future<void> loadPlannedExpenses() async {
    _plannedExpenses = await _plannedExpenseDao.getPlannedExpenses();
    notifyListeners();
  }

  Future<void> addPlannedExpense(PlannedExpense plannedExpense) async {
    await _plannedExpenseDao.insertPlannedExpense(plannedExpense);
    await loadPlannedExpenses();
  }

  Future<void> loadIncomes() async {
    _incomes = await _incomeDao.getIncomes();
    notifyListeners();
  }

  Future<void> addIncome(Income income) async {
    await _incomeDao.insertIncome(income);
    await loadIncomes();
  }
}