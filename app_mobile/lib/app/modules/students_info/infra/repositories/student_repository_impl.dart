import 'package:dartz/dartz.dart';

import '../../domain/entities/student_info.dart';
import '../models/student_info_model.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../../domain/interfaces/infra/student_info_repository.dart';
import '../interfaces/student_datasource.dart';

class StudentInfoRepositoryImpl implements StudentInfoRepository {
  final StudentInfoDatasource datasource;

  const StudentInfoRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureApp, StudentInfo>> get(int courseId) async {
    try {
      final result = await datasource.get(courseId);
      return right(StudentInfoModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }

  @override
  Future<Either<FailureApp, StudentInfo>> update(
      int studentId, StudentInfo studentInfo) async {
    try {
      final result = await datasource.update(
          studentId, StudentInfoModel.toMap(studentInfo));
      return right(StudentInfoModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }

  @override
  Future<Either<FailureApp, String>> delete(int courseId) async {
    try {
      final result = await datasource.delete(courseId);
      return right(result);
    } catch (e) {
      return left(FailureApp());
    }
  }
}
