import 'package:app_mobile/app/core/shared/utils/enums/status_type.dart';
import 'package:app_mobile/app/modules/courses/domain/entities/course.dart';
import 'package:app_mobile/app/modules/courses/presenter/widgets/popup_add_course_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/course_controller.dart';
import '../widgets/card_course_widget.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final controller = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.state) {
        case StatusType.load:
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        case StatusType.error:
          return const Scaffold(
            body: Center(
              child: Text(
                'Erro ao carregar os Cursos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 64,
                ),
              ),
            ),
          );
        case StatusType.success:
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => Get.dialog(PopUpAddCourseWidget()),
              child: const Icon(Icons.add, size: 32),
            ),
            bottomNavigationBar: const SizedBox(
              height: kToolbarHeight,
            ),
            body: ListView.builder(
              itemCount: controller.courses.length,
              itemBuilder: (context, item) {
                return CardCourseWidget(
                  course: controller.courses[item],
                );
              },
            ),
          );
        default:
          return const SizedBox();
      }
    });
  }
}
