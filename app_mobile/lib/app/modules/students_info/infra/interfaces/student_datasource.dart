abstract class StudentInfoDatasource {
  Future<Map> get(int courseId);

  Future<Map> update(int courseId, Map course);

  Future<String> delete(int courseId);
}
