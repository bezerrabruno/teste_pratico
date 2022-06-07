import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../entities/student_info.dart';

abstract class UpdateStudentInfoUsecase {
  Future<Either<FailureApp, StudentInfo>> call(
      int courseId, StudentInfo courseInfo);
}
