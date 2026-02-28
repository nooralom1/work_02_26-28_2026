import 'package:dio/dio.dart';
import 'package:work_02_2026/feature/profile/model/profile_model.dart';
import 'package:work_02_2026/networks/dio/dio.dart';
import 'package:work_02_2026/networks/endpoints.dart';
import 'package:work_02_2026/networks/exception_handler/data_source.dart';

final class GetOwnProfileApi {
  static final GetOwnProfileApi _singleton = GetOwnProfileApi._internal();
  GetOwnProfileApi._internal();
  static GetOwnProfileApi get instance => _singleton;

  Future<ProfileResponseModel> getOwnProfileApi() async {
    try {
      Response response = await getHttp(Endpoints.getProfile());

      if (response.statusCode == 200) {
        final data = ProfileResponseModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
