import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../entities/student.dart';

abstract class StudentRepository {
  Future<Either<FailureApp, List<Student>>> get();

  Future<Either<FailureApp, List<Student>>> add(Student student);
}
