import 'package:login_course_app/providers/product_providers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth_providers.dart';
import 'bottom_navigation_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthProviders()),
  ChangeNotifierProvider(create: (_) => ProductsProvider()),
  ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
];
