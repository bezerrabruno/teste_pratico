import 'package:get/get.dart';

import '/app/core/shared/utils/api_base.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../infra/interfaces/student_datasource.dart';

class StudentDatasourceImpl implements StudentDatasource {
  final GetConnect _connect;

  const StudentDatasourceImpl(this._connect);

  @override
  Future<List> get() async {
    try {
      final response = await _connect.get(
        '${ApiBase.url}/students',
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
  Future<List> add(Map student) async {
    try {
      final response = await _connect.post(
        '${ApiBase.url}/students',
        student,
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
