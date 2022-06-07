import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

abstract class DeleteCourseInfoUsecase {
  Future<Either<FailureApp, String>> call(int courseId);
}
