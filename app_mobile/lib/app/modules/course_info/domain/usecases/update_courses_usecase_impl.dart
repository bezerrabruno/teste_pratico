import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/domain/update_course_info_usecase.dart';
import '../interfaces/infra/course_info_repository.dart';
import '../entities/course_info.dart';

class UpdateCourseInfoUsecaseImpl implements UpdateCourseInfoUsecase {
  final CourseInfoRepository repository;

  const UpdateCourseInfoUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, CourseInfo>> call(
      int courseId, CourseInfo courseInfo) async {
    return await repository.update(courseId, courseInfo);
  }
}
