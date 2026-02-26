import 'package:flutter/material.dart';

class AuthProviders with ChangeNotifier {
  //////============= student parent ================/////
  int selectedIndex = 0;
  void setSelectedTabIndex({required index}) {
    selectedIndex = index;
    notifyListeners();
  }

  //////============= Global Veriables ================/////
  bool isLoading = false;
}
