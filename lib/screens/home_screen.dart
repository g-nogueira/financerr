import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/user.dart';

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
          return ListView.builder(
            itemCount: appProvider.users.length,
            itemBuilder: (context, index) {
              final user = appProvider.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newUser = User(
            id: '1',
            name: 'John Doe',
            email: 'john.doe@example.com',
            createdAt: DateTime.now(),
            isActive: true,
          );
          context.read<AppProvider>().addUser(newUser);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}