import 'package:app_mobile/app/core/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_mobile/app/core/shared/utils/enums/status_type.dart';

import '../../domain/interfaces/domain/get_students_usecase.dart';
import '../../domain/interfaces/domain/add_student_usecase.dart';

import 'package:app_mobile/app/modules/students/domain/entities/student.dart';

class StudentController extends GetxController {
  final GetStudentsUsecase getStudentsUsecase;
  final AddStudentUsecase addStudentUsecase;

  StudentController(this.getStudentsUsecase, this.addStudentUsecase);

  final _state = StatusType.load.obs;
  StatusType get state => _state.value;
  set state(StatusType value) => _state.value = value;

  final _studant = Student(name: '').obs;
  Student get studant => _studant.value;
  set studant(Student value) => _studant.value = value;

  final students = <Student>[].obs;

  final formKeyStudents = GlobalKey<FormState>();

  @override
  void onReady() {
    getStudents();
    super.onReady();
  }

  toStudentInfo(int id) {
    Get.toNamed(Routes.studentInfo, arguments: {'studentId': id})!
        .then((_) => getStudents());
  }

  void getStudents() async {
    state = StatusType.load;

    final result = await getStudentsUsecase();

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        students.clear();
        students.addAll(r);
        state = StatusType.success;
      },
    );
  }

  void addStudent() async {
    state = StatusType.load;

    final result = await addStudentUsecase(studant);

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        students.clear();
        students.addAll(r);
        state = StatusType.success;
      },
    );
  }

  String? vaildate(String? text) {
    if (text == null || text.isEmpty) {
      return 'Preencha o campo.';
    } else {
      return null;
    }
  }
}
