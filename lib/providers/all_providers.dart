import 'package:flutter/material.dart';

final class AllProviders extends ChangeNotifier {
  ////////// -------------- For Chat -------------- ///////////
  bool isChatOpen = false;
  void openChat() {
    isChatOpen = !isChatOpen;
    notifyListeners();
  }

  ////////// -------------- For Course Details Tabs -------------- ///////////
  int selectedIndex = 0;
  void setSelectedTabIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  ////////// -------------- For Navigation Screen -------------- ///////////
  int currentIndex = 0;
}
