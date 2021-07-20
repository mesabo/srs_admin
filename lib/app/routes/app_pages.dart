import 'package:get/get.dart';
import 'package:srs_admin/app/views/main/main_screen.dart';
import 'package:srs_admin/app/views/screens/services/services_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.MAINSCREEN,
      page: () => MainScreen(),
    ),GetPage(
      name: Routes.SERVICESSCREEN,
      page: () => ServicesPage(),
    ),
  ];
}
