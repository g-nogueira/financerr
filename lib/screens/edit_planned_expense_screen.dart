import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/planned_expense.dart';
import '../providers/app_provider.dart';

class EditPlannedExpenseScreen extends StatefulWidget {
  final PlannedExpense? expense;

  const EditPlannedExpenseScreen({super.key, this.expense});

  @override
  _EditPlannedExpenseScreenState createState() => _EditPlannedExpenseScreenState();
}

class _EditPlannedExpenseScreenState extends State<EditPlannedExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  late String? _expenseCategory;
  late String _description;
  late double _valuePlanned;
  late int _expenseDayOfTheMonth;
  late bool _canFluctuate;
  late String _paymentMethod;

  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      _expenseCategory = widget.expense!.expenseCategory ?? '';
      _valuePlanned = widget.expense!.valuePlanned;
      _expenseDayOfTheMonth = widget.expense!.expenseDayOfTheMonth;
      _canFluctuate = widget.expense!.canFluctuate;
      _paymentMethod = widget.expense!.paymentMethod;
    } else {
      _expenseCategory = '';
      _valuePlanned = 0.0;
      _expenseDayOfTheMonth = 1;
      _canFluctuate = false;
      _paymentMethod = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.expense == null ? 'Add Expense' : 'Edit Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _expenseCategory,
                decoration: InputDecoration(labelText: 'Category'),
                onSaved: (value) => _expenseCategory = value ?? '',
              ),
              TextFormField(
                initialValue: _valuePlanned.toString(),
                decoration: InputDecoration(labelText: 'Planned Value'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _valuePlanned = double.parse(value ?? '0'),
              ),
              TextFormField(
                initialValue: _expenseDayOfTheMonth.toString(),
                decoration: InputDecoration(labelText: 'Day of the Month'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _expenseDayOfTheMonth = int.parse(value ?? '1'),
              ),
              SwitchListTile(
                title: Text('Can Fluctuate'),
                value: _canFluctuate,
                onChanged: (value) => setState(() => _canFluctuate = value),
              ),
              TextFormField(
                initialValue: _paymentMethod,
                decoration: InputDecoration(labelText: 'Payment Method'),
                onSaved: (value) => _paymentMethod = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newExpense = PlannedExpense(
                      id: widget.expense?.id ?? DateTime.now().toString(),
                      userId: '1', // Assuming a single user for simplicity
                      expenseCategory: _expenseCategory,
                      description: _description,
                      valuePlanned: _valuePlanned,
                      expenseDayOfTheMonth: _expenseDayOfTheMonth,
                      canFluctuate: _canFluctuate,
                      paymentMethod: _paymentMethod,
                    );
                    if (widget.expense == null) {
                      context.read<AppProvider>().addPlannedExpense(newExpense);
                    } else {
                      context.read<AppProvider>().updatePlannedExpense(newExpense);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.expense == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}