import 'package:app_mobile/app/modules/course_info/course_info_binding.dart';
import 'package:app_mobile/app/modules/course_info/presenter/pages/course_info_page.dart';
import 'package:app_mobile/app/modules/students_info/presenter/pages/student_info_page.dart';
import 'package:app_mobile/app/modules/students_info/student_info_binding.dart';
import 'package:get/get.dart';

import '/app/modules/splash/presenter/pages/splash_page.dart';
import '/app/modules/splash/splash_binding.dart';
import '/app/modules/home/home_binding.dart';
import '/app/modules/home/presenter/pages/home_page.dart';

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
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.courseInfo,
      page: () => const CourseInfoPage(),
      binding: CourseInfoBinding(),
    ),
    GetPage(
      name: Routes.studentInfo,
      page: () => const StudentInfoPage(),
      binding: StudentInfoBinding(),
    ),
  ];
}
