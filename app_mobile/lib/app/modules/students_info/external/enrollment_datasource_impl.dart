import 'package:get/get.dart';

import '../infra/interfaces/enrollment_datasource.dart';
import '/app/core/shared/utils/api_base.dart';
import '/app/core/shared/utils/failures_defalt.dart';

class EnrollmentForStudentDatasourceImpl
    implements EnrollmentForStudentDatasource {
  final GetConnect _connect;

  const EnrollmentForStudentDatasourceImpl(this._connect);

  @override
  Future<List> get(int id) async {
    try {
      final response = await _connect.get(
        '${ApiBase.url}/enrollment/student/$id',
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
  Future<List> add(Map enrollment) async {
    try {
      final response = await _connect.post(
        '${ApiBase.url}/enrollment/student',
        enrollment,
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
  Future<List> delete(int courseId, int studentId) async {
    try {
      final response = await _connect.post(
        '${ApiBase.url}/enrollment/student/delete',
        {
          'courseId': courseId,
          'studentId': studentId,
        },
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
