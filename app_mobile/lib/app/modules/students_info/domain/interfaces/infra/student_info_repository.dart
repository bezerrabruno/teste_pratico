import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../entities/student_info.dart';

abstract class StudentInfoRepository {
  Future<Either<FailureApp, StudentInfo>> get(int courseId);

  Future<Either<FailureApp, StudentInfo>> update(
      int courseId, StudentInfo courseInfo);

  Future<Either<FailureApp, String>> delete(int courseId);
}
