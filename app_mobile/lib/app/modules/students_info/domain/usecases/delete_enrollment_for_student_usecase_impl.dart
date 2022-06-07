import 'package:dartz/dartz.dart';

import '../entities/course_student.dart';
import '../interfaces/domain/delete_enrollment_for_student_usecase.dart';
import '../interfaces/infra/enrollment_for_student_repository.dart';
import '/app/core/shared/utils/failures_defalt.dart';

class DeleteEnrollmentForStudentUsecaseImpl
    implements DeleteEnrollmentForStudentUsecase {
  final EnrollmentForStudentRepository repository;

  const DeleteEnrollmentForStudentUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<CourseStudent>>> call(
      int courseId, int studentId) async {
    return await repository.delete(courseId, studentId);
  }
}
