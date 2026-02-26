import 'package:dio/dio.dart';
import 'package:work_02_2026/feature/home/model/all_course_model.dart';
import 'package:work_02_2026/networks/dio/dio.dart';
import 'package:work_02_2026/networks/endpoints.dart';
import 'package:work_02_2026/networks/exception_handler/data_source.dart';

final class AllCourseListApi {
  static final AllCourseListApi _singleton = AllCourseListApi._internal();
  AllCourseListApi._internal();
  static AllCourseListApi get instance => _singleton;

  Future<AllCourseListModel> allCourseListApi({required String pageNo}) async {
    try {
      Response response = await getHttp(Endpoints.allCourse(pageNo));

      if (response.statusCode == 200) {
        final data = AllCourseListModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
