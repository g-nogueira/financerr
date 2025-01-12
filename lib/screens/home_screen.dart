import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/user.dart';
import '../models/planned_expense.dart';
import '../models/income.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: appProvider.users.length,
                  itemBuilder: (context, index) {
                    final user = appProvider.users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: appProvider.plannedExpenses.length,
                  itemBuilder: (context, index) {
                    final expense = appProvider.plannedExpenses[index];
                    return ListTile(
                      title: Text(expense.expenseCategory),
                      subtitle: Text(expense.valuePlanned.toString()),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: appProvider.incomes.length,
                  itemBuilder: (context, index) {
                    final income = appProvider.incomes[index];
                    return ListTile(
                      title: Text(income.value.toString()),
                      subtitle: Text(income.incomeDay.toIso8601String()),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/expenses');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}