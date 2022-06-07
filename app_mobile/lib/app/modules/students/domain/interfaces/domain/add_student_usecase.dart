import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../entities/student.dart';

abstract class AddStudentUsecase {
  Future<Either<FailureApp, List<Student>>> call(Student student);
}
