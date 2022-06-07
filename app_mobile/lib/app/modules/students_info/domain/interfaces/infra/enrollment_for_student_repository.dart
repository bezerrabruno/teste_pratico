import 'package:dartz/dartz.dart';

import '../../entities/course_student.dart';
import '/app/core/shared/utils/failures_defalt.dart';

abstract class EnrollmentForStudentRepository {
  Future<Either<FailureApp, List<CourseStudent>>> get(int courseId);

  Future<Either<FailureApp, List<CourseStudent>>> add(
      int courseId, int studentId);

  Future<Either<FailureApp, List<CourseStudent>>> delete(
      int courseId, int studentId);
}
