import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/course_info_controller.dart';

class PopUpEnrollmentCourseWidget extends StatelessWidget {
  final controller = Get.find<CourseInfoController>();
  final colors = Get.theme.colorScheme;

  PopUpEnrollmentCourseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 48),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Curso',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Form(
                key: controller.formKeyCourse,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        onChanged: (text) =>
                            controller.studanteId = int.tryParse(text)!,
                        validator: (text) => controller.vaildate(text),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 50,
                        keyboardType: TextInputType.name,
                        decoration:
                            const InputDecoration(hintText: 'Id do estudante'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKeyCourse.currentState!.validate()) {
                          controller.addEnrollment();
                          Get.back();
                        }
                      },
                      child: const Text('Matricula'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
