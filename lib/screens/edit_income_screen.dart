import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/income.dart';
import '../providers/app_provider.dart';

class EditIncomeScreen extends StatefulWidget {
  final Income? income;

  const EditIncomeScreen({Key? key, this.income}) : super(key: key);

  @override
  _EditIncomeScreenState createState() => _EditIncomeScreenState();
}

class _EditIncomeScreenState extends State<EditIncomeScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _userId;
  late double _value;
  late int _incomeDay;

  @override
  void initState() {
    super.initState();
    if (widget.income != null) {
      _userId = widget.income!.userId;
      _value = widget.income!.value;
      _incomeDay = widget.income!.incomeDay;
    } else {
      _userId = '1'; // Assuming a single user for simplicity
      _value = 0.0;
      _incomeDay = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.income == null ? 'Add Income' : 'Edit Income'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _value.toString(),
                decoration: InputDecoration(labelText: 'Value'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _value = double.parse(value ?? '0'),
              ),
              TextFormField(
                initialValue: _incomeDay.toString(),
                decoration: InputDecoration(labelText: 'Day of the Month'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _incomeDay = int.parse(value ?? '1'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newIncome = Income(
                      id: widget.income?.id ?? DateTime.now().toString(),
                      userId: _userId,
                      value: _value,
                      incomeDay: _incomeDay,
                    );
                    if (widget.income == null) {
                      context.read<AppProvider>().addIncome(newIncome);
                    } else {
                      context.read<AppProvider>().updateIncome(newIncome);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.income == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}