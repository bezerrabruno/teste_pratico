import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

abstract class DeleteStudentInfoUsecase {
  Future<Either<FailureApp, String>> call(int courseId);
}
