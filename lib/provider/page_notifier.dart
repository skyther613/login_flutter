import 'package:flutter/material.dart';
import 'package:login_flutter/pages/home.dart';
import 'package:login_flutter/pages/login.dart';

class PageNotifier extends ChangeNotifier {

  String _currentPage = MyHomePage.pageName;
  String get currentPage=>_currentPage;

  void goToHome() {
    _currentPage = MyHomePage.pageName;
    notifyListeners();
  }

  void goToOtherPage(String name) {
    _currentPage = name;
    notifyListeners();
  }
}