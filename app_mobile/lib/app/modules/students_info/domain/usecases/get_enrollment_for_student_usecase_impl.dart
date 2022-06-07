import 'package:dartz/dartz.dart';

import '../entities/course_student.dart';
import '../interfaces/domain/get_enrollment_for_student_usecase.dart';
import '../interfaces/infra/enrollment_for_student_repository.dart';
import '/app/core/shared/utils/failures_defalt.dart';

class GetEnrollmentForStudentUsecaseImpl
    implements GetEnrollmentForStudentUsecase {
  final EnrollmentForStudentRepository repository;

  const GetEnrollmentForStudentUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<CourseStudent>>> call(int courseId) async {
    return await repository.get(courseId);
  }
}
