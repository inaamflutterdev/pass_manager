// password_provider.dart
import 'package:flutter/material.dart';
import 'package:password_manager/model/password_model.dart';

class PasswordProvider extends ChangeNotifier {
  final List<PasswordModel> _passwords = [];

  List<PasswordModel> get passwords => _passwords;

  void addPassword(PasswordModel password) {
    _passwords.add(password);
    notifyListeners();
  }

  void deletePassword(int index) {
    _passwords.removeAt(index);
    notifyListeners();
  }
}
