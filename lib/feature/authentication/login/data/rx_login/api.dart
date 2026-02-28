// ignore_for_file: unused_import

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:work_02_2026/networks/dio/dio.dart';
import 'package:work_02_2026/networks/endpoints.dart';
import 'package:work_02_2026/networks/exception_handler/data_source.dart';

final class LogInApi {
  static final LogInApi _singleton = LogInApi._internal();
  LogInApi._internal();
  static LogInApi get instance => _singleton;
  Future<Map<String, dynamic>> logInApi({
    required String username,
    required String password,
  }) async {
    try {
      Map data = {"username": username, "password": password};
      Response response = await postHttp(Endpoints.logIn(), data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
