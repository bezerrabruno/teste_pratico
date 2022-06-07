import 'package:dartz/dartz.dart';

import '../entities/student_course.dart';
import '../interfaces/domain/add_enrollment_usecase.dart';
import '../interfaces/infra/enrollment_repository.dart';
import '/app/core/shared/utils/failures_defalt.dart';

class AddEnrollmentUsecaseImpl implements AddEnrollmentUsecase {
  final EnrollmentRepository repository;

  const AddEnrollmentUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<StudentCourse>>> call(
      int courseId, int studantId) async {
    return await repository.add(courseId, studantId);
  }
}
