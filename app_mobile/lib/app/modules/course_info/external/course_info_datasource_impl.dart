import 'package:get/get.dart';

import '/app/core/shared/utils/api_base.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../infra/interfaces/course_datasource.dart';

class CourseInfoDatasourceImpl implements CourseInfoDatasource {
  final GetConnect _connect;

  const CourseInfoDatasourceImpl(this._connect);

  @override
  Future<Map> get(int id) async {
    try {
      final response = await _connect.get(
        '${ApiBase.url}/courses/$id',
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw FailureApp();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map> update(int id, Map course) async {
    try {
      final response = await _connect.put(
        '${ApiBase.url}/courses/$id',
        course,
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw FailureApp();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> delete(int id) async {
    try {
      final response = await _connect.delete(
        '${ApiBase.url}/courses/$id',
      );

      if (response.statusCode == 200) {
        return 'Success';
      } else {
        throw FailureApp();
      }
    } catch (e) {
      rethrow;
    }
  }
}
