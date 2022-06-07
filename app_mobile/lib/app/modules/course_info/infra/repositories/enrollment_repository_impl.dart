import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../../domain/interfaces/infra/enrollment_repository.dart';
import '../interfaces/enrollment_datasource.dart';
import '../../domain/entities/student_course.dart';
import '../models/studant_course_model.dart';

class EnrollmentRepositoryImpl implements EnrollmentRepository {
  final EnrollmentDatasource datasource;

  const EnrollmentRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureApp, List<StudentCourse>>> get(int courseId) async {
    try {
      final result = await datasource.get(courseId);
      return right(StudentCourseModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }

  @override
  Future<Either<FailureApp, List<StudentCourse>>> add(
      int courseId, int studentId) async {
    try {
      final result = await datasource.add(
        {
          'courseId': courseId,
          'studentId': studentId,
        },
      );
      return right(StudentCourseModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }

  @override
  Future<Either<FailureApp, List<StudentCourse>>> delete(
      int courseId, int studentId) async {
    try {
      final result = await datasource.delete(courseId, studentId);
      return right(StudentCourseModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }
}
