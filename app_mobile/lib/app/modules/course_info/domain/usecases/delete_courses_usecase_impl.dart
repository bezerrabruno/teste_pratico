import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/domain/delete_course_info_usecase.dart';
import '../interfaces/infra/course_info_repository.dart';

class DeleteCourseInfoUsecaseImpl implements DeleteCourseInfoUsecase {
  final CourseInfoRepository repository;

  const DeleteCourseInfoUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, String>> call(int courseId) async {
    return await repository.delete(courseId);
  }
}
