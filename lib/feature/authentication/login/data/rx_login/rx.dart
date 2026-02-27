import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:work_02_2026/constants/app_constants.dart';
import 'package:work_02_2026/feature/authentication/login/data/rx_login/api.dart';
import 'package:work_02_2026/feature/authentication/login/model/login_response_model.dart';
import 'package:work_02_2026/helpers/di.dart';
import 'package:work_02_2026/helpers/toast.dart';
import 'package:work_02_2026/networks/dio/dio.dart';
import 'package:work_02_2026/networks/rx_base.dart';

final class LogInRX extends RxResponseInt<LoginResponseModel> {
  final api = LogInApi.instance;

  LogInRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> logInRX({
    required String username,
    required String password,
  }) async {
    try {
      LoginResponseModel data = await api.logInApi(
        username: username,
        password: password,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      handleErrorWithReturn(error);
      return false;
    }
  }

  @override
  handleSuccessWithReturn(LoginResponseModel data) {
    appData.write(kKeyAccessToken, data.token);
    appData.write(kKeyIsLoggedIn, true);
    String token = appData.read(kKeyAccessToken);
    DioSingleton.instance.update(token);
    dataFetcher.sink.add(data);
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response?.statusCode == 422) {
        ToastUtil.showShortToast(error.response?.data["message"] ?? "Error");
      } else {
        ToastUtil.showShortToast(error.response?.data["message"] ?? "Error");
      }
    } else {
      ToastUtil.showShortToast("An unexpected error occurred.");
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
  }
}
