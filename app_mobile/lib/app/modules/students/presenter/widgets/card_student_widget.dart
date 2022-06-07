import 'package:app_mobile/app/modules/students/presenter/controllers/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/student.dart';

class CardStudentWidget extends StatelessWidget {
  final Student student;
  final colors = Get.theme.colorScheme;
  final controller = Get.find<StudentController>();

  CardStudentWidget({Key? key, required this.student}) : super(key: key);

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
            onTap: () => controller.toStudentInfo(student.id!),
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
                  Text(
                    'id: ${student.id}',
                    style: TextStyle(
                      color: colors.onSurface,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
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
