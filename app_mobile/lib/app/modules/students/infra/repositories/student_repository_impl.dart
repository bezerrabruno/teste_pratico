import 'package:app_mobile/app/modules/students/infra/interfaces/student_datasource.dart';
import 'package:app_mobile/app/modules/students/infra/models/students_model.dart';
import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../domain/interfaces/infra/student_repository.dart';
import '../../domain/entities/student.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentDatasource datasource;

  const StudentRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureApp, List<Student>>> get() async {
    try {
      final result = await datasource.get();
      return right(StudentModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }

  @override
  Future<Either<FailureApp, List<Student>>> add(Student student) async {
    try {
      final result = await datasource.add(StudentModel.toMap(student));
      return right(StudentModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }
}
