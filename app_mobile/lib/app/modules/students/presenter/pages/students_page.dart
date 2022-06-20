import 'package:app_mobile/app/core/shared/utils/enums/status_type.dart';
import 'package:app_mobile/app/modules/students/presenter/widgets/popup_add_student_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/student_controller.dart';
import '../widgets/card_student_widget.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final controller = Get.find<StudentController>();

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
                'Erro ao carregar os Alunos',
                style: TextStyle(
                  fontSize: 64,
                ),
              ),
            ),
          );
        case StatusType.success:
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => Get.dialog(PopUpAddStudentWidget()),
              child: const Icon(Icons.add, size: 32),
            ),
            bottomNavigationBar: const SizedBox(
              height: kToolbarHeight,
            ),
            body: ListView.builder(
              itemCount: controller.students.length,
              itemBuilder: (context, item) {
                return CardStudentWidget(
                  student: controller.students[item],
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
