import 'package:dartz/dartz.dart';

import '../../entities/course_student.dart';
import '/app/core/shared/utils/failures_defalt.dart';

abstract class DeleteEnrollmentForStudentUsecase {
  Future<Either<FailureApp, List<CourseStudent>>> call(
      int courseId, int studentId);
}
