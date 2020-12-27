import 'package:flutter/material.dart';

class AmeerProvider extends ChangeNotifier {
  String name = 'ahmed';
  String address = 'gaza';
  List<String> notifications = [];
  List products = [];
  changeData(String name, String address) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      this.name = name;
      this.address = address;
      notifyListeners();
    });
  }

  refeshData() {}

  printValues() {
    print(this.name);
    print(this.address);
  }
}
