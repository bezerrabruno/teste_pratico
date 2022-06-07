import 'package:app_mobile/app/modules/students_info/domain/entities/course_student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/student_info_controller.dart';

class CardCourseWidget extends StatelessWidget {
  final CourseStudent course;
  final colors = Get.theme.colorScheme;
  final controller = Get.find<StudentInfoController>();

  CardCourseWidget({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SizedBox(
        height: 80,
        width: double.maxFinite,
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: colors.surface,
          child: InkWell(
            onTap: () => true,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.book,
                          size: 48,
                          color: colors.secondary,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            course.name.length > 15
                                ? '${course.name.substring(0, 15)}...'
                                : course.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.onSurface,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            course.description!.length > 20
                                ? '${course.description!.substring(0, 20)}...'
                                : course.description ??
                                    'Este curso não tem descrição',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.onSurface,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => controller.deleteEnrollment(course.id!),
                    icon: const Icon(Icons.delete_outline),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
