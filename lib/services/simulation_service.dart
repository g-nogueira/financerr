import 'package:financerr/models/planned_expense.dart';
import 'package:financerr/models/income.dart';

class SimulationService {
  List<Map<String, dynamic>> calculateDailySimulations(
      List<PlannedExpense> expenses, List<Income> incomes) {
    // Initialize a map to store daily balances
    Map<int, double> dailyBalances = {};

    // Initialize daily balances for each day of the month
    for (int day = 1; day <= 31; day++) {
      dailyBalances[day] = 0.0;
    }

    // Process incomes
    for (var income in incomes) {
      for (int day = 1; day <= 31; day++) {
        if (day >= income.incomeDay) {
          dailyBalances[day] = (dailyBalances[day] ?? 0) + income.value;
        }
      }
    }

    // Process expenses
    for (var expense in expenses) {
      for (int day = 1; day <= 31; day++) {
        if (day >= expense.expenseDayOfTheMonth) {
          dailyBalances[day] = (dailyBalances[day] ?? 0) - expense.valuePlanned;
        }
      }
    }

    // Convert the map to a list of daily summaries
    List<Map<String, dynamic>> dailySummaries = [];
    dailyBalances.forEach((date, balance) {
      dailySummaries.add({
        'date': date,
        'balance': balance,
      });
    });

    // Sort the summaries by date
    dailySummaries.sort((a, b) => a['date'].compareTo(b['date']));

    return dailySummaries;
  }
}
