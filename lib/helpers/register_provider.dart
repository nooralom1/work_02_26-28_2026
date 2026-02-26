import 'package:provider/provider.dart';
import 'package:work_02_2026/providers/all_providers.dart';
import 'package:work_02_2026/providers/auth_providers.dart';

var providers = [
  ChangeNotifierProvider<AllProviders>(create: ((context) => AllProviders())),
  ChangeNotifierProvider<AuthProviders>(create: ((context) => AuthProviders())),
];
