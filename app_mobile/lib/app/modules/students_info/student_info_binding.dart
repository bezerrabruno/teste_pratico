import 'package:app_mobile/app/modules/students_info/external/enrollment_datasource_impl.dart';
import 'package:get/get.dart';

import 'domain/usecases/add_enrollment_for_student_usecase_impl.dart';
import 'domain/usecases/delete_enrollment_for_student_usecase_impl.dart';
import 'domain/usecases/delete_student_usecase_impl.dart';
import 'domain/usecases/get_enrollment_for_student_usecase_impl.dart';
import 'domain/usecases/get_student_usecase_impl.dart';
import 'domain/usecases/update_student_usecase_impl.dart';
import 'external/student_info_datasource_impl.dart';
import 'infra/repositories/enrollment_repository_impl.dart';
import 'infra/repositories/student_repository_impl.dart';
import 'presenter/controllers/student_info_controller.dart';

class StudentInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetConnect());

    //Course
    Get.lazyPut(() => StudentInfoDatasourceImpl(Get.find<GetConnect>()));

    Get.lazyPut(
        () => StudentInfoRepositoryImpl(Get.find<StudentInfoDatasourceImpl>()));

    Get.lazyPut(
      () => GetStudentInfoUsecaseImpl(Get.find<StudentInfoRepositoryImpl>()),
    );
    Get.lazyPut(
      () => UpdateStudentInfoUsecaseImpl(Get.find<StudentInfoRepositoryImpl>()),
    );
    Get.lazyPut(
      () => DeleteStudentInfoUsecaseImpl(Get.find<StudentInfoRepositoryImpl>()),
    );

    //Enrollment
    Get.lazyPut(
        () => EnrollmentForStudentDatasourceImpl(Get.find<GetConnect>()));

    Get.lazyPut(() => EnrollmentForStudentRepositoryImpl(
        Get.find<EnrollmentForStudentDatasourceImpl>()));

    Get.lazyPut(
      () => GetEnrollmentForStudentUsecaseImpl(
          Get.find<EnrollmentForStudentRepositoryImpl>()),
    );
    Get.lazyPut(
      () => AddEnrollmentForStudentUsecaseImpl(
          Get.find<EnrollmentForStudentRepositoryImpl>()),
    );
    Get.lazyPut(
      () => DeleteEnrollmentForStudentUsecaseImpl(
          Get.find<EnrollmentForStudentRepositoryImpl>()),
    );

    Get.lazyPut(
      () => StudentInfoController(
        Get.find<GetStudentInfoUsecaseImpl>(),
        Get.find<UpdateStudentInfoUsecaseImpl>(),
        Get.find<DeleteStudentInfoUsecaseImpl>(),
        Get.find<GetEnrollmentForStudentUsecaseImpl>(),
        Get.find<AddEnrollmentForStudentUsecaseImpl>(),
        Get.find<DeleteEnrollmentForStudentUsecaseImpl>(),
      ),
    );
  }
}
