abstract class EnrollmentDatasource {
  Future<List> get(int courseId);

  Future<List> add(Map enrollment);

  Future<List> delete(int courseId, int studentId);
}
