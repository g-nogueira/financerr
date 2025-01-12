import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:financerr/services/simulation_service.dart';
import 'package:financerr/dao/planned_expense_dao.dart';
import 'package:financerr/dao/income_dao.dart';
import 'package:financerr/models/planned_expense.dart';
import 'package:financerr/models/income.dart';

final getIt = GetIt.instance;

class SimulationProvider with ChangeNotifier {
  final SimulationService _simulationService = SimulationService();
  final PlannedExpenseDao _plannedExpenseDao = getIt<PlannedExpenseDao>();
  final IncomeDao _incomeDao = getIt<IncomeDao>();

  List<Map<String, dynamic>> _dailySimulations = [];
  List<Map<String, dynamic>> get dailySimulations => _dailySimulations;

  Future<void> loadSimulations() async {
    List<PlannedExpense> expenses = await _plannedExpenseDao.getPlannedExpenses();
    List<Income> incomes = await _incomeDao.getIncomes();
    _dailySimulations = _simulationService.calculateDailySimulations(expenses, incomes);
    notifyListeners();
  }
}