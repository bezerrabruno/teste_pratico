import 'package:dartz/dartz.dart';

import '../interfaces/infra/student_repository.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/domain/get_students_usecase.dart';
import '../entities/student.dart';

class GetStudentsUsecaseImpl implements GetStudentsUsecase {
  final StudentRepository repository;

  const GetStudentsUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<Student>>> call() async {
    return await repository.get();
  }
}
