import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'edit_planned_expense_screen.dart';

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
                title: Text("${expense.expenseDayOfTheMonth} - ${expense.description}"),
                subtitle: Text(expense.valuePlanned.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPlannedExpenseScreen(expense: expense),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPlannedExpenseScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}