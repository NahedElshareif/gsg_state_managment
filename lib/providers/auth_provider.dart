import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String userName = 'aUserName';
  setUserName(String userName) {
    this.userName = userName;
    notifyListeners();
  }
}
