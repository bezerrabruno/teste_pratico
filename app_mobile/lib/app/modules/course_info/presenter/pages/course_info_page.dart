import 'package:app_mobile/app/core/shared/utils/enums/status_type.dart';
import 'package:app_mobile/app/modules/course_info/presenter/controllers/course_info_controller.dart';
import 'package:app_mobile/app/modules/home/presenter/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseInfoPage extends StatefulWidget {
  const CourseInfoPage({Key? key}) : super(key: key);

  @override
  State<CourseInfoPage> createState() => _CourseInfoPageState();
}

class _CourseInfoPageState extends State<CourseInfoPage> {
  final controller = Get.find<CourseInfoController>();
  final colors = Get.theme.colorScheme;

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
                'Erro ao carregar os dados do Curso',
                style: TextStyle(
                  fontSize: 64,
                ),
              ),
            ),
          );
        case StatusType.success:
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Curso',
                  style: TextStyle(
                    color: colors.onPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(controller.course.name),
                      Text(controller.course.description!),
                      Text(controller.course.menu!),
                      Text(controller.course.enrollments!.toString()),
                    ],
                  )),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: const [
                          Center(
                            child: Text('Matriculados'),
                          ),
                        ],
                      )),
                ],
              ));
        default:
          return const SizedBox();
      }
    });
  }
}
