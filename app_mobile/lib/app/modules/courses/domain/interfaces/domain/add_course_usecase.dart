import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../entities/course.dart';

abstract class AddCourseUsecase {
  Future<Either<FailureApp, List<Course>>> call(Course course);
}
