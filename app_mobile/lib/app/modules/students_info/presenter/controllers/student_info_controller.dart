import 'package:app_mobile/app/core/shared/utils/enums/status_type.dart';
import 'package:app_mobile/app/modules/students_info/domain/interfaces/domain/add_enrollment_for_student_usecase.dart';
import 'package:app_mobile/app/modules/students_info/domain/interfaces/domain/delete_enrollment_for_student_usecase.dart';
import 'package:app_mobile/app/modules/students_info/domain/interfaces/domain/get_enrollment_for_student_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/course_student.dart';
import '../../domain/entities/student_info.dart';
import '../../domain/interfaces/domain/delete_student_info_usecase.dart';
import '../../domain/interfaces/domain/get_student_info_usecase.dart';
import '../../domain/interfaces/domain/update_student_info_usecase.dart';

class StudentInfoController extends GetxController {
  final GetStudentInfoUsecase getStudentInfoUsecase;
  final UpdateStudentInfoUsecase updateStudentInfoUsecase;
  final DeleteStudentInfoUsecase deleteStudentInfoUsecase;

  final GetEnrollmentForStudentUsecase getEnrollmentForStudentUsecase;
  final AddEnrollmentForStudentUsecase addEnrollmentForStudentUsecase;
  final DeleteEnrollmentForStudentUsecase deleteEnrollmentForStudentUsecase;

  StudentInfoController(
    this.getStudentInfoUsecase,
    this.updateStudentInfoUsecase,
    this.deleteStudentInfoUsecase,
    this.getEnrollmentForStudentUsecase,
    this.addEnrollmentForStudentUsecase,
    this.deleteEnrollmentForStudentUsecase,
  );

  final _state = StatusType.load.obs;
  StatusType get state => _state.value;
  set state(StatusType value) => _state.value = value;

  final _student = StudentInfo(name: '').obs;
  StudentInfo get student => _student.value;
  set student(StudentInfo value) => _student.value = value;

  final int studanteId = Get.arguments['studentId'];
  int courseId = 0;

  final studentsCourse = <CourseStudent>[].obs;

  final formKeyCourse = GlobalKey<FormState>();

  @override
  void onReady() {
    getStudent();
    super.onReady();
  }

  void getStudent() async {
    state = StatusType.load;

    final result = await getStudentInfoUsecase(studanteId);

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        student = r;
        getEnrollment();
      },
    );
  }

  void getEnrollment() async {
    state = StatusType.load;

    final result = await getEnrollmentForStudentUsecase(studanteId);

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        studentsCourse.clear();
        studentsCourse.addAll(r);
        state = StatusType.success;
      },
    );
  }

  void updateStudent() async {
    state = StatusType.load;

    final result = await updateStudentInfoUsecase(studanteId, student);

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        state = StatusType.success;
      },
    );
  }

  void deleteStudent() async {
    if (studentsCourse.isNotEmpty) {
      state = StatusType.success;
      return;
    }

    state = StatusType.load;

    final result = await deleteStudentInfoUsecase(studanteId);

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        Get.back();
        state = StatusType.success;
      },
    );
  }

  void addEnrollment() async {
    state = StatusType.load;

    final result = await addEnrollmentForStudentUsecase(courseId, studanteId);

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        studentsCourse.clear();
        studentsCourse.addAll(r);
        state = StatusType.success;
      },
    );
  }

  void deleteEnrollment(int id) async {
    state = StatusType.load;

    final result = await deleteEnrollmentForStudentUsecase(courseId, id);

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        studentsCourse.clear();
        studentsCourse.addAll(r);
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
