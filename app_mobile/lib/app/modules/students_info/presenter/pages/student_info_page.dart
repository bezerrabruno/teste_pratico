import 'package:app_mobile/app/core/shared/utils/enums/status_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/student_info_controller.dart';
import '../widgets/card_course_widget.dart';
import '../widgets/popup_enrollment_studant_widget.dart';
import '../widgets/popup_update_course_widget.dart';

class StudentInfoPage extends StatefulWidget {
  const StudentInfoPage({Key? key}) : super(key: key);

  @override
  State<StudentInfoPage> createState() => _StudentInfoPageState();
}

class _StudentInfoPageState extends State<StudentInfoPage> {
  final controller = Get.find<StudentInfoController>();
  final colors = Get.theme.colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Aluno',
          style: TextStyle(
            color: colors.onPrimary,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.dialog(PopUpUpdateCourseWidget()),
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () => controller.deleteStudent(),
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(PopUpEnrollmentCourseWidget()),
        child: const Icon(Icons.add, size: 32),
      ),
      body: Obx(() {
        switch (controller.state) {
          case StatusType.load:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case StatusType.error:
            return const Center(
              child: Text(
                'Erro ao carregar os dados do Aluno',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 64,
                ),
              ),
            );
          case StatusType.success:
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                controller.student.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colors.onBackground,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'idade:',
                              style: TextStyle(
                                color: colors.secondary,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              controller.student.age!.toString(),
                              style: TextStyle(
                                color: colors.onBackground,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Cursos Atuais:',
                              style: TextStyle(
                                color: colors.secondary,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              controller.studentsCourse.length.toString(),
                              style: TextStyle(
                                color: colors.onBackground,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Center(
                    child: Text(
                      'Matriculados',
                      style: TextStyle(
                        color: colors.onBackground,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: controller.studentsCourse.isEmpty
                        ? const Center(
                            child: Text(
                              'Nenhuma matricula registrada ainda',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.studentsCourse.length,
                            itemBuilder: (context, item) {
                              return CardCourseWidget(
                                course: controller.studentsCourse[item],
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
          default:
            return const SizedBox();
        }
      }),
    );
  }
}
