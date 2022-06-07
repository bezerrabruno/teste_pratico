import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/student_info_controller.dart';

class PopUpUpdateCourseWidget extends StatelessWidget {
  final controller = Get.find<StudentInfoController>();
  final colors = Get.theme.colorScheme;

  PopUpUpdateCourseWidget({Key? key}) : super(key: key);

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
                        initialValue: controller.student.name,
                        onChanged: (text) => controller.student.name = text,
                        validator: (text) => controller.vaildate(text),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 50,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(hintText: 'Nome'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        initialValue: controller.student.age.toString(),
                        onChanged: (text) =>
                            controller.student.age = int.tryParse(text),
                        maxLength: 50,
                        keyboardType: TextInputType.name,
                        decoration:
                            const InputDecoration(hintText: 'Descrição'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKeyCourse.currentState!.validate()) {
                          controller.updateStudent();
                          Get.back();
                        }
                      },
                      child: const Text('Adicionar'),
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
