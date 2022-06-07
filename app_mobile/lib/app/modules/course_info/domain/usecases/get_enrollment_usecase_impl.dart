import 'package:app_mobile/app/modules/course_info/domain/interfaces/domain/get_enrollment_usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/student_course.dart';
import '../interfaces/infra/enrollment_repository.dart';
import '/app/core/shared/utils/failures_defalt.dart';

class GetEnrollmentUsecaseImpl implements GetEnrollmentUsecase {
  final EnrollmentRepository repository;

  const GetEnrollmentUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<StudentCourse>>> call(int courseId) async {
    return await repository.get(courseId);
  }
}
