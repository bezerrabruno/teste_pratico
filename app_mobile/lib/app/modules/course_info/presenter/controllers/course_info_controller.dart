import 'package:app_mobile/app/modules/course_info/domain/interfaces/domain/get_enrollment_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/interfaces/domain/add_enrollment_usecase.dart';
import '../../domain/interfaces/domain/delete_enrollment_usecase.dart';
import '/app/core/shared/utils/enums/status_type.dart';

import '../../domain/interfaces/domain/get_course_info_usecase.dart';
import '../../domain/usecases/update_courses_usecase_impl.dart';
import '../../domain/interfaces/domain/delete_course_info_usecase.dart';
import '../../domain/entities/student_course.dart';
import '../../domain/entities/course_info.dart';

class CourseInfoController extends GetxController {
  final GetCourseInfoUsecase getCoursesUsecase;
  final UpdateCourseInfoUsecaseImpl updateCourseInfoUsecase;
  final DeleteCourseInfoUsecase deleteCourseInfoUsecase;

  final GetEnrollmentUsecase getEnrollmentUsecase;
  final AddEnrollmentUsecase addEnrollmentUsecase;
  final DeleteEnrollmentUsecase deleteEnrollmentUsecase;

  CourseInfoController(
    this.getCoursesUsecase,
    this.updateCourseInfoUsecase,
    this.deleteCourseInfoUsecase,
    this.getEnrollmentUsecase,
    this.addEnrollmentUsecase,
    this.deleteEnrollmentUsecase,
  );

  final _state = StatusType.load.obs;
  StatusType get state => _state.value;
  set state(StatusType value) => _state.value = value;

  final _course = CourseInfo(name: '').obs;
  CourseInfo get course => _course.value;
  set course(CourseInfo value) => _course.value = value;

  final int courseId = Get.arguments['courseId'];
  int studanteId = 0;

  final studentsCourse = <StudentCourse>[].obs;

  final formKeyCourse = GlobalKey<FormState>();

  @override
  void onReady() {
    getCourse();
    super.onReady();
  }

  void getCourse() async {
    state = StatusType.load;

    final result = await getCoursesUsecase(courseId);

    result.fold(
      (l) {
        print(l);
        state = StatusType.error;
      },
      (r) {
        course = r;
        getEnrollment();
      },
    );
  }

  void getEnrollment() async {
    state = StatusType.load;

    final result = await getEnrollmentUsecase(courseId);

    result.fold(
      (l) {
        print(l);
        state = StatusType.error;
      },
      (r) {
        studentsCourse.clear();
        studentsCourse.addAll(r);
        state = StatusType.success;
      },
    );
  }

  void updateCourse() async {
    state = StatusType.load;

    final result = await updateCourseInfoUsecase(courseId, course);

    result.fold(
      (l) {
        print(l);
        state = StatusType.error;
      },
      (r) {
        state = StatusType.success;
      },
    );
  }

  void deleteCourse() async {
    if (studentsCourse.isNotEmpty) {
      state = StatusType.success;
      return;
    }

    state = StatusType.load;

    final result = await deleteCourseInfoUsecase(courseId);

    result.fold(
      (l) {
        print(l);
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

    final result = await addEnrollmentUsecase(courseId, studanteId);

    result.fold(
      (l) {
        print(l);
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

    final result = await deleteEnrollmentUsecase(courseId, id);

    result.fold(
      (l) {
        print(l);
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
