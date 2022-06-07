import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/domain/add_course_usecase.dart';
import '../interfaces/infra/course_repository.dart';
import '../entities/course.dart';

class AddCourseUsecaseImpl implements AddCourseUsecase {
  final CourseRepository repository;

  const AddCourseUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<Course>>> call(Course course) async {
    return await repository.add(course);
  }
}
