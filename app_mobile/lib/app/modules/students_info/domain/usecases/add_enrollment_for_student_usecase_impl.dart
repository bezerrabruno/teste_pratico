import 'package:app_mobile/app/core/shared/utils/failures_defalt.dart';
import 'package:dartz/dartz.dart';

import '../entities/course_student.dart';
import '../interfaces/domain/add_enrollment_for_student_usecase.dart';
import '../interfaces/infra/enrollment_for_student_repository.dart';

class AddEnrollmentForStudentUsecaseImpl
    implements AddEnrollmentForStudentUsecase {
  final EnrollmentForStudentRepository repository;

  const AddEnrollmentForStudentUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<CourseStudent>>> call(
      int courseId, int studentId) async {
    return await repository.add(courseId, studentId);
  }
}
