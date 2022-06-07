import 'package:dartz/dartz.dart';

import '../../domain/entities/course_student.dart';
import '../../domain/interfaces/infra/enrollment_for_student_repository.dart';
import '../models/course_student_model.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/enrollment_datasource.dart';

class EnrollmentForStudentRepositoryImpl
    implements EnrollmentForStudentRepository {
  final EnrollmentForStudentDatasource datasource;

  const EnrollmentForStudentRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureApp, List<CourseStudent>>> get(int courseId) async {
    try {
      final result = await datasource.get(courseId);
      return right(CourseStudentModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }

  @override
  Future<Either<FailureApp, List<CourseStudent>>> add(
      int courseId, int studentId) async {
    try {
      final result = await datasource.add(
        {
          'courseId': courseId,
          'studentId': studentId,
        },
      );
      return right(CourseStudentModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }

  @override
  Future<Either<FailureApp, List<CourseStudent>>> delete(
      int courseId, int studentId) async {
    try {
      final result = await datasource.delete(courseId, studentId);
      return right(CourseStudentModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }
}
