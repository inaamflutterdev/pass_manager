// add_password_screen.dart
import 'package:flutter/material.dart';
import 'package:password_manager/model/password_model.dart';
import 'package:password_manager/provider/password_provider.dart';
import 'package:provider/provider.dart';

class AddPasswordScreen extends StatelessWidget {
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AddPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: websiteController,
              decoration: const InputDecoration(labelText: 'Website'),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final passwordProvider =
                    Provider.of<PasswordProvider>(context, listen: false);
                final newPassword = PasswordModel(
                  website: websiteController.text,
                  username: usernameController.text,
                  password: passwordController.text,
                );
                passwordProvider.addPassword(newPassword);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
