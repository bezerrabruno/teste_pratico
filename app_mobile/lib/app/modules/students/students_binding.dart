import 'package:get/get.dart';

import 'external/student_datasource_impl.dart';
import 'infra/repositories/student_repository_impl.dart';
import 'domain/usecases/get_students_usecase_impl.dart';
import 'domain/usecases/add_student_usecase_impl.dart';
import 'presenter/controllers/student_controller.dart';

class StudentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetConnect());

    Get.lazyPut(() => StudentDatasourceImpl(Get.find<GetConnect>()));

    Get.lazyPut(() => StudentRepositoryImpl(Get.find<StudentDatasourceImpl>()));

    Get.lazyPut(
      () => GetStudentsUsecaseImpl(Get.find<StudentRepositoryImpl>()),
    );
    Get.lazyPut(
      () => AddStudentUsecaseImpl(Get.find<StudentRepositoryImpl>()),
    );
    Get.lazyPut(
      () => StudentController(
        Get.find<GetStudentsUsecaseImpl>(),
        Get.find<AddStudentUsecaseImpl>(),
      ),
    );
  }
}
