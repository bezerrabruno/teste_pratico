import 'package:dartz/dartz.dart';

import '../models/course_info_model.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../../domain/interfaces/infra/course_info_repository.dart';
import '../interfaces/course_datasource.dart';
import '../../domain/entities/course_info.dart';

class CourseInfoRepositoryImpl implements CourseInfoRepository {
  final CourseInfoDatasource datasource;

  const CourseInfoRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureApp, CourseInfo>> get(int courseId) async {
    try {
      final result = await datasource.get(courseId);
      return right(CourseInfoModel.fromMap(result));
    } catch (e) {
      return left(FailureApp());
    }
  }

  @override
  Future<Either<FailureApp, CourseInfo>> update(
      int courseId, CourseInfo courseInfo) async {
    try {
      final result =
          await datasource.update(courseId, CourseInfoModel.toMap(courseInfo));
      return right(CourseInfoModel.fromMap(result));
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
