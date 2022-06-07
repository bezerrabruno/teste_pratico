import 'package:dartz/dartz.dart';

import '../entities/student_course.dart';
import '../interfaces/domain/delete_enrollment_usecase.dart';
import '../interfaces/infra/enrollment_repository.dart';
import '/app/core/shared/utils/failures_defalt.dart';

class DeleteEnrollmentUsecaseImpl implements DeleteEnrollmentUsecase {
  final EnrollmentRepository repository;

  const DeleteEnrollmentUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<StudentCourse>>> call(
      int courseId, int studentId) async {
    return await repository.delete(courseId, studentId);
  }
}
