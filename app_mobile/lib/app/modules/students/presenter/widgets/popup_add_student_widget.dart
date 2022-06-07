import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/student_controller.dart';

class PopUpAddStudentWidget extends StatelessWidget {
  final controller = Get.find<StudentController>();
  final colors = Get.theme.colorScheme;

  PopUpAddStudentWidget({Key? key}) : super(key: key);

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
                'Aluno',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Form(
                key: controller.formKeyStudents,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        onChanged: (text) => controller.studant.name = text,
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
                        onChanged: (text) =>
                            controller.studant.age = int.tryParse(text),
                        maxLength: 50,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(hintText: 'Age'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKeyStudents.currentState!
                            .validate()) {
                          controller.addStudent();
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
