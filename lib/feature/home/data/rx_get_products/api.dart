import 'package:dio/dio.dart';
import 'package:work_02_2026/feature/home/model/product_list_model.dart';
import 'package:work_02_2026/networks/dio/dio.dart';
import 'package:work_02_2026/networks/endpoints.dart';
import 'package:work_02_2026/networks/exception_handler/data_source.dart';

final class ProductListApi {
  static final ProductListApi _singleton = ProductListApi._internal();
  ProductListApi._internal();
  static ProductListApi get instance => _singleton;
  Future<List<ProductListModel>> productListApi() async {
    try {
      Response response = await getHttp(Endpoints.products());
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => ProductListModel.fromJson(e)).toList();
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
