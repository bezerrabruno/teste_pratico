import 'package:app_mobile/app/modules/students/students_binding.dart';
import 'package:get/get.dart';

import '/app/modules/splash/presenter/pages/splash_page.dart';
import '/app/modules/splash/splash_binding.dart';
import '/app/modules/home/home_binding.dart';
import '/app/modules/home/presenter/pages/home_page.dart';
import '/app/modules/courses/courses_binding.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      bindings: [
        HomeBinding(),
        CoursesBinding(),
        StudentBinding(),
      ],
    ),
  ];
}
