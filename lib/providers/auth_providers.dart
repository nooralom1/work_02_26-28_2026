import 'package:flutter/material.dart';
import 'package:work_02_2026/helpers/toast.dart';
import 'package:work_02_2026/networks/api_access.dart';

class AuthProviders with ChangeNotifier {
  //////============= Global Veriables ================/////
  bool isLoading = false;

  ////////// -------------- For Navigation Screen -------------- ///////////
  int currentIndex = 0;

  //////============= Login ================/////
  Future<bool> loginSubmit({
    required String userName,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      final success = await logInRXOBJ.logInRX(
        username: userName,
        password: password,
      );
      if (success) {
        ToastUtil.showShortToast("Login successful");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      ToastUtil.showShortToast(e.toString());
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
