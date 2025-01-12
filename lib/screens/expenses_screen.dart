import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/planned_expense.dart';

class PlannedExpensesScreen extends StatelessWidget {
  const PlannedExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planned Expenses'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return ListView.builder(
            itemCount: appProvider.plannedExpenses.length,
            itemBuilder: (context, index) {
              final expense = appProvider.plannedExpenses[index];
              return ListTile(
                title: Text(expense.expenseCategory ?? 'null value'),
                subtitle: Text(expense.valuePlanned.toString()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newExpense = PlannedExpense(
            id: '1',
            userId: '1',
            expenseCategory: 'Groceries',
            description: 'Groceries',
            valuePlanned: 100.0,
            expenseDayOfTheMonth: 1,
            canFluctuate: false,
            paymentMethod: 'Credit Card',
          );
          context.read<AppProvider>().addPlannedExpense(newExpense);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}