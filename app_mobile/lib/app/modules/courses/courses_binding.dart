import 'package:get/get.dart';

import 'external/course_datasource_impl.dart';
import 'infra/repositories/course_repository_impl.dart';
import 'domain/usecases/get_courses_usecase_impl.dart';
import 'domain/usecases/add_course_usecase_impl.dart';
import 'presenter/controllers/course_controller.dart';

class CoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetConnect());

    Get.lazyPut(() => CourseDatasourceImpl(Get.find<GetConnect>()));

    Get.lazyPut(() => CourseRepositoryImpl(Get.find<CourseDatasourceImpl>()));

    Get.lazyPut(
      () => GetCoursesUsecaseImpl(Get.find<CourseRepositoryImpl>()),
    );
    Get.lazyPut(
      () => AddCourseUsecaseImpl(Get.find<CourseRepositoryImpl>()),
    );
    Get.lazyPut(
      () => CourseController(
        Get.find<GetCoursesUsecaseImpl>(),
        Get.find<AddCourseUsecaseImpl>(),
      ),
    );
  }
}
