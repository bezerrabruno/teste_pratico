import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/domain/get_courses_usecase.dart';
import '../interfaces/infra/course_repository.dart';
import '../entities/course.dart';

class GetCoursesUsecaseImpl implements GetCoursesUsecase {
  final CourseRepository repository;

  const GetCoursesUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<Course>>> call() async {
    return await repository.get();
  }
}
