import 'package:rxdart/rxdart.dart';
import 'package:work_02_2026/feature/authentication/login/data/rx_login/rx.dart';
import 'package:work_02_2026/feature/home/data/rx_get_products/rx.dart';
import 'package:work_02_2026/feature/home/model/product_list_model.dart';
import 'package:work_02_2026/feature/profile/data/rx_get_profile/rx.dart';
import 'package:work_02_2026/feature/profile/model/profile_model.dart';

// LogInRX
LogInRX logInRXOBJ = LogInRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// GetOwnProfileRx
GetOwnProfileRx getOwnProfileRxOBJ = GetOwnProfileRx(
  empty: ProfileResponseModel(),
  dataFetcher: BehaviorSubject<ProfileResponseModel>(),
);

// ProductListRx Object

ProductListRx productListRxOBJ = ProductListRx(
  empty: [],
  dataFetcher: BehaviorSubject<List<ProductListModel>>(),
);
