import 'package:dartz/dartz.dart';

import '../models/course_model.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../../domain/interfaces/infra/course_repository.dart';
import '../interfaces/course_datasource.dart';
import '../../domain/entities/course.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseDatasource datasource;

  const CourseRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureApp, List<Course>>> get() async {
    try {
      final result = await datasource.get();
      return right(CourseModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }

  @override
  Future<Either<FailureApp, List<Course>>> add(Course course) async {
    try {
      final result = await datasource.add(CourseModel.toMap(course));
      return right(CourseModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }
}
