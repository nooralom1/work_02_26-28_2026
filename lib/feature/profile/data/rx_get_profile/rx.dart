// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:work_02_2026/constants/app_constants.dart';
import 'package:work_02_2026/feature/profile/data/rx_get_profile/api.dart';
import 'package:work_02_2026/feature/profile/model/profile_model.dart';
import 'package:work_02_2026/helpers/di.dart';
import 'package:work_02_2026/networks/rx_base.dart';

final class GetOwnProfileRx extends RxResponseInt<ProfileResponseModel> {
  final api = GetOwnProfileApi.instance;

  GetOwnProfileRx({required super.empty, required super.dataFetcher});

  ValueStream get commentSteam => dataFetcher.stream;

  Future<ProfileResponseModel?> getOwnProfileRx() async {
    try {
      final ProfileResponseModel data = await api.getOwnProfileApi();
      handleSuccessWithReturn(data);
      return data;
    } catch (error) {
      if (error is DioException) {
        if (error.response?.data["message"] == "Unauthenticated.") {
          await appData.write(kKeyIsLoggedIn, false);
          await appData.write(kKeyAccessToken, '');
        }
      }
      log(error.toString());
    }
  }

  @override
  handleErrorWithReturn(dynamic error) async {
    if (error is DioException) {
      if (error.response!.statusCode == 422) {
        if (error.response?.data["message"] == "Unauthenticated.") {
          await appData.write(kKeyIsLoggedIn, false);
          await appData.write(kKeyAccessToken, '');
        }
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);

    return false;
  }
}
