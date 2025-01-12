import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:financerr/providers/simulation_provider.dart';

class SimulationScreen extends StatelessWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Simulations'),
      ),
      body: Consumer<SimulationProvider>(
        builder: (context, simulationProvider, child) {
          return ListView.builder(
            itemCount: simulationProvider.dailySimulations.length,
            itemBuilder: (context, index) {
              final simulation = simulationProvider.dailySimulations[index];
              return ListTile(
                title: Text(simulation['date'].toString()),
                subtitle: Text('Balance: ${simulation['balance']}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SimulationProvider>().loadSimulations();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}