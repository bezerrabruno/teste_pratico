import 'package:app_mobile/app/modules/course_info/domain/usecases/get_enrollment_usecase_impl.dart';
import 'package:app_mobile/app/modules/course_info/external/enrollment_datasource_impl.dart';
import 'package:app_mobile/app/modules/course_info/infra/repositories/enrollment_repository_impl.dart';
import 'package:get/get.dart';

import 'domain/usecases/add_enrollment_usecase_impl.dart';
import 'domain/usecases/delete_enrollment_usecase_impl.dart';
import 'external/course_info_datasource_impl.dart';
import 'infra/repositories/course_repository_impl.dart';
import 'domain/usecases/get_courses_usecase_impl.dart';
import 'domain/usecases/update_courses_usecase_impl.dart';
import 'domain/usecases/delete_courses_usecase_impl.dart';
import 'presenter/controllers/course_info_controller.dart';

class CourseInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetConnect());

    //Course
    Get.lazyPut(() => CourseInfoDatasourceImpl(Get.find<GetConnect>()));

    Get.lazyPut(
        () => CourseInfoRepositoryImpl(Get.find<CourseInfoDatasourceImpl>()));

    Get.lazyPut(
      () => GetCourseInfoUsecaseImpl(Get.find<CourseInfoRepositoryImpl>()),
    );
    Get.lazyPut(
      () => UpdateCourseInfoUsecaseImpl(Get.find<CourseInfoRepositoryImpl>()),
    );
    Get.lazyPut(
      () => DeleteCourseInfoUsecaseImpl(Get.find<CourseInfoRepositoryImpl>()),
    );

    //Enrollment
    Get.lazyPut(() => EnrollmentDatasourceImpl(Get.find<GetConnect>()));

    Get.lazyPut(
        () => EnrollmentRepositoryImpl(Get.find<EnrollmentDatasourceImpl>()));

    Get.lazyPut(
      () => GetEnrollmentUsecaseImpl(Get.find<EnrollmentRepositoryImpl>()),
    );
    Get.lazyPut(
      () => AddEnrollmentUsecaseImpl(Get.find<EnrollmentRepositoryImpl>()),
    );
    Get.lazyPut(
      () => DeleteEnrollmentUsecaseImpl(Get.find<EnrollmentRepositoryImpl>()),
    );

    Get.lazyPut(
      () => CourseInfoController(
        Get.find<GetCourseInfoUsecaseImpl>(),
        Get.find<UpdateCourseInfoUsecaseImpl>(),
        Get.find<DeleteCourseInfoUsecaseImpl>(),
        Get.find<GetEnrollmentUsecaseImpl>(),
        Get.find<AddEnrollmentUsecaseImpl>(),
        Get.find<DeleteEnrollmentUsecaseImpl>(),
      ),
    );
  }
}
