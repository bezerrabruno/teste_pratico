import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../entities/course_info.dart';

abstract class CourseInfoRepository {
  Future<Either<FailureApp, CourseInfo>> get(int courseId);

  Future<Either<FailureApp, CourseInfo>> update(
      int courseId, CourseInfo courseInfo);

  Future<Either<FailureApp, String>> delete(int courseId);
}
