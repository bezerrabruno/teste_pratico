import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../entities/course.dart';

abstract class CourseRepository {
  Future<Either<FailureApp, List<Course>>> get();

  Future<Either<FailureApp, List<Course>>> add(Course couse);
}
