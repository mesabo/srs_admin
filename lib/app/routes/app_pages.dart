import 'package:get/get.dart';
import 'package:srs_admin/app/views/screens/main/main_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => MainScreen(),
    ),
  ];
}
