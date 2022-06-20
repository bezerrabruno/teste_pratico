import 'package:app_mobile/app/core/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../courses/courses_binding.dart';
import '../../../students/presenter/pages/students_page.dart';
import '../../../students/students_binding.dart';
import '../controllers/home_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/buttom_bar_widget.dart';

import '../../../courses/presenter/pages/courses_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: ButtomBarWidget(),
      extendBody: true,
      body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: Routes.courses,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case Routes.courses:
                return GetPageRoute(
                  page: () => const CoursesPage(),
                  binding: CoursesBinding(),
                );
              case Routes.students:
                return GetPageRoute(
                  page: () => const StudentsPage(),
                  binding: StudentsBinding(),
                );
              default:
                return GetPageRoute(
                  page: () => const Scaffold(),
                );
            }
          }),
    );
  }
}
