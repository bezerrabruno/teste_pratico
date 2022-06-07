import 'package:app_mobile/app/core/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_mobile/app/core/shared/utils/enums/status_type.dart';
import 'package:app_mobile/app/modules/courses/domain/interfaces/domain/get_courses_usecase.dart';
import 'package:app_mobile/app/modules/courses/domain/interfaces/domain/add_course_usecase.dart';

import '../../domain/entities/course.dart';

class CourseController extends GetxController {
  final GetCoursesUsecase getCoursesUsecase;
  final AddCourseUsecase addCourseUsecase;

  CourseController(this.getCoursesUsecase, this.addCourseUsecase);

  final _state = StatusType.load.obs;
  StatusType get state => _state.value;
  set state(StatusType value) => _state.value = value;

  final _course = Course(name: '').obs;
  Course get course => _course.value;
  set course(Course value) => _course.value = value;

  final courses = <Course>[].obs;

  final formKeyCourses = GlobalKey<FormState>();

  @override
  void onReady() {
    getCourses();
    super.onReady();
  }

  toCourseInfo(int id) {
    Get.toNamed(Routes.courseInfo, arguments: {'courseId': id})!
        .then((_) => getCourses());
  }

  void getCourses() async {
    state = StatusType.load;

    final result = await getCoursesUsecase();

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        courses.clear();
        courses.addAll(r);
        state = StatusType.success;
      },
    );
  }

  void addCourse() async {
    state = StatusType.load;

    final result = await addCourseUsecase(course);

    result.fold(
      (l) {
        state = StatusType.error;
      },
      (r) {
        courses.clear();
        courses.addAll(r);
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
