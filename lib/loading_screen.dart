// ignore_for_file: strict_top_level_inference, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:work_02_2026/constants/app_constants.dart';
import 'package:work_02_2026/navigation.dart';
import 'package:work_02_2026/networks/dio/dio.dart';
import 'package:work_02_2026/welcome_screen.dart';

import 'helpers/di.dart';
import 'helpers/helper_methods.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await loadInitialData();
  }

  Future<void> loadInitialData() async {
    await setInitValue();
    bool data = appData.read(kKeyIsLoggedIn) ?? false;
    if (data) {
      String token = appData.read(kKeyAccessToken) ?? "";
      DioSingleton.instance.update(token);
    }
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return NavigationScreen();
    }
  }
}
