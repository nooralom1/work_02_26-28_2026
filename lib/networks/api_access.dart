import 'package:rxdart/rxdart.dart';
import 'package:work_02_2026/feature/home/data/rx_get_products/rx.dart';
import 'package:work_02_2026/feature/home/model/all_course_model.dart';

// // LogInRX
// LogInRX logInRXOBJ = LogInRX(
//   empty: LoginResponseModel(),
//   dataFetcher: BehaviorSubject<LoginResponseModel>(),
// );

// // SignUpRX
// SignUpRX signUpRXOBJ = SignUpRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// CoursedetailsRx
AllCourseListRx allCourseListRxOBJ = AllCourseListRx(
  empty: AllCourseListModel(),
  dataFetcher: BehaviorSubject<AllCourseListModel>(),
);
