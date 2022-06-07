import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../entities/student_info.dart';

abstract class GetStudentInfoUsecase {
  Future<Either<FailureApp, StudentInfo>> call(int courseId);
}
