import 'package:app_mobile/app/modules/course_info/domain/entities/student_course.dart';
import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

abstract class AddEnrollmentUsecase {
  Future<Either<FailureApp, List<StudentCourse>>> call(
      int courseId, int studantId);
}
