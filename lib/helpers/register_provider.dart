import 'package:provider/provider.dart';
import 'package:work_02_2026/providers/auth_providers.dart';

var providers = [
  ChangeNotifierProvider<AuthProviders>(create: ((context) => AuthProviders())),
];
