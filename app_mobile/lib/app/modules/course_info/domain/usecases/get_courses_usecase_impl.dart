import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/domain/get_course_info_usecase.dart';
import '../interfaces/infra/course_info_repository.dart';
import '../entities/course_info.dart';

class GetCourseInfoUsecaseImpl implements GetCourseInfoUsecase {
  final CourseInfoRepository repository;

  const GetCourseInfoUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, CourseInfo>> call(int courseId) async {
    return await repository.get(courseId);
  }
}
