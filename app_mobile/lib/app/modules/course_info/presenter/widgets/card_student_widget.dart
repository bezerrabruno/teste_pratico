import 'package:app_mobile/app/modules/course_info/domain/entities/student_course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/course_info_controller.dart';

class CardStudentWidget extends StatelessWidget {
  final controller = Get.find<CourseInfoController>();
  final StudentCourse student;
  final colors = Get.theme.colorScheme;

  CardStudentWidget({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        height: 80,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colors.surface,
        ),
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
                      Icons.person,
                      size: 48,
                      color: colors.secondary,
                    ),
                  ),
                  Text(
                    student.name.length > 20
                        ? '${student.name.substring(0, 20)}...'
                        : student.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.onSurface,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => controller.deleteEnrollment(student.id!),
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
