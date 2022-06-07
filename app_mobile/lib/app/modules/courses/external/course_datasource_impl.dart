import 'package:get/get.dart';

import '/app/core/shared/utils/api_base.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../infra/interfaces/course_datasource.dart';

class CourseDatasourceImpl implements CourseDatasource {
  final GetConnect _connect;

  const CourseDatasourceImpl(this._connect);

  @override
  Future<List> get() async {
    try {
      final response = await _connect.get(
        '${ApiBase.url}/courses',
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
  Future<List> add(Map course) async {
    try {
      final response = await _connect.post(
        '${ApiBase.url}/courses',
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
}
