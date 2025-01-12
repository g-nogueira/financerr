import 'package:financerr/models/planned_expense.dart';
import 'package:financerr/models/income.dart';

class SimulationService {
  List<Map<String, dynamic>> calculateDailySimulations(
      List<PlannedExpense> expenses, List<Income> incomes) {
    // Initialize a map to store daily balances
    Map<int, double> dailyBalances = {};

    // Initialize daily balances for each day of the month
    for (int day = 0; day <= 31; day++) {
      dailyBalances[day] = 0.0;
    }

    // Calculate the initial balance (day 0) based on the total income
    double initialBalance = incomes.fold(0.0, (sum, income) => sum + income.value);
    dailyBalances[0] = initialBalance;

    // Process each day of the month, starting from day 1
    for (int day = 1; day <= 31; day++) {
      // Carry over the balance from the previous day
      dailyBalances[day] = dailyBalances[day - 1] as double;

      if (day < incomes[0].incomeDay) {
        // If the current day is before the first income day, skip it
        continue;
      }

      // Sum the expenses for the current day
      var totalExpense = expenses
          .where((expense) => expense.expenseDayOfTheMonth == day)
          .fold(0.0, (sum, expense) => sum + expense.valuePlanned);

      // Subtract expenses for the current day
      dailyBalances[day] = (dailyBalances[day] ?? 0.0) - totalExpense;

      // Sum the incomes for the current day
      var totalIncomes = incomes
          .where((income) => income.incomeDay == day)
          .fold(0.0, (sum, income) => sum + income.value);
      
      // Add incomes for the current day
      dailyBalances[day] = (dailyBalances[day] ?? 0.0) + totalIncomes;
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
