import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/expenses_screen.dart';
import 'services/service_locator.dart';
import 'providers/app_provider.dart';

void main() {
  setupLocator();
  runApp(Financerr());
}

class Financerr extends StatelessWidget {
  const Financerr({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        title: 'Financerr',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          '/expenses': (context) => PlannedExpensesScreen(),
        },
      ),
    );
  }
}