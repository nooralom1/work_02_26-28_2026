// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:work_02_2026/feature/home/data/rx_get_products/api.dart';
import 'package:work_02_2026/feature/home/model/all_course_model.dart';
import 'package:work_02_2026/helpers/toast.dart';
import 'package:work_02_2026/networks/rx_base.dart';

final class AllCourseListRx extends RxResponseInt<AllCourseListModel> {
  final api = AllCourseListApi.instance;

  AllCourseListRx({required super.empty, required super.dataFetcher});

  ValueStream get commentSteam => dataFetcher.stream;

  Future<AllCourseListModel?> allCourseListRx({required String pageNo}) async {
    try {
      final AllCourseListModel data = await api.allCourseListApi(
        pageNo: pageNo,
      );
      handleSuccessWithReturn(data);
      return data;
    } catch (error) {
      if (error is DioException) {
        ToastUtil.showShortToast(
          error.response?.data["message"] ?? "Unknown error",
        );
      }
      log(error.toString());
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 422) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);

    return false;
  }
}
