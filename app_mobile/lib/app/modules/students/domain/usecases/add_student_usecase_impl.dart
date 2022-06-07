import 'package:app_mobile/app/modules/students/domain/interfaces/infra/student_repository.dart';
import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../entities/student.dart';
import '../interfaces/domain/add_student_usecase.dart';

class AddStudentUsecaseImpl implements AddStudentUsecase {
  final StudentRepository repository;

  const AddStudentUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, List<Student>>> call(Student student) async {
    return await repository.add(student);
  }
}
