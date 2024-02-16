// password_list_screen.dart
import 'package:flutter/material.dart';
import 'package:password_manager/provider/password_provider.dart';
import 'package:provider/provider.dart';
import 'add_password_screen.dart';

class PasswordListScreen extends StatelessWidget {
  const PasswordListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Manager'),
      ),
      body: Consumer<PasswordProvider>(
        builder: (context, passwordProvider, child) {
          final passwords = passwordProvider.passwords;

          return ListView.builder(
            itemCount: passwords.length,
            itemBuilder: (context, index) {
              final password = passwords[index];
              return ListTile(
                title: Text(password.website),
                subtitle: Text(password.username),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    passwordProvider.deletePassword(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPasswordScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
