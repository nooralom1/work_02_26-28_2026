import 'package:rxdart/rxdart.dart';
import 'package:work_02_2026/feature/authentication/login/data/rx_login/rx.dart';
import 'package:work_02_2026/feature/authentication/login/model/login_response_model.dart';
import 'package:work_02_2026/feature/home/data/rx_get_products/rx.dart';
import 'package:work_02_2026/feature/home/model/product_list_model.dart';

// LogInRX
LogInRX logInRXOBJ = LogInRX(
  empty: LoginResponseModel(),
  dataFetcher: BehaviorSubject<LoginResponseModel>(),
);

// // SignUpRX
// SignUpRX signUpRXOBJ = SignUpRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// CoursedetailsRx
// ProductListRx Object

ProductListRx productListRxOBJ = ProductListRx(
  empty: [],
  dataFetcher: BehaviorSubject<List<ProductListModel>>(),
);
