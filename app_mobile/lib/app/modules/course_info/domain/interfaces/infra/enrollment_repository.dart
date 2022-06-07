import 'package:dartz/dartz.dart';

import '../../entities/student_course.dart';
import '/app/core/shared/utils/failures_defalt.dart';

abstract class EnrollmentRepository {
  Future<Either<FailureApp, List<StudentCourse>>> get(int courseId);

  Future<Either<FailureApp, List<StudentCourse>>> add(
      int courseId, int studentId);

  Future<Either<FailureApp, List<StudentCourse>>> delete(
      int courseId, int studentId);
}
