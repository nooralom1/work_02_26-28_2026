// ignore_for_file: body_might_complete_normally_nullable

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:work_02_2026/feature/home/data/rx_get_products/api.dart';
import 'package:work_02_2026/feature/home/model/product_list_model.dart';
import 'package:work_02_2026/helpers/toast.dart';
import 'package:work_02_2026/networks/rx_base.dart';

final class ProductListRx extends RxResponseInt<List<ProductListModel>> {
  final api = ProductListApi.instance;
  ProductListRx({required super.empty, required super.dataFetcher});
  ValueStream<List<ProductListModel>> get productStream => dataFetcher.stream;
  Future<List<ProductListModel>?> productListRx() async {
    try {
      final List<ProductListModel> data = await api.productListApi();
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
      ToastUtil.showShortToast(
        error.response?.data["message"] ?? "Unknown Error",
      );
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }
}
