import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../entities/course_info.dart';

abstract class UpdateCourseInfoUsecase {
  Future<Either<FailureApp, CourseInfo>> call(
      int courseId, CourseInfo courseInfo);
}
