// main.dart
import 'package:flutter/material.dart';
import 'package:password_manager/provider/password_provider.dart';
import 'package:password_manager/screens/login_screen.dart';
import 'package:password_manager/screens/password_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PasswordProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Password Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/passwordList': (context) => const PasswordListScreen(),
        },
      ),
    );
  }
}
