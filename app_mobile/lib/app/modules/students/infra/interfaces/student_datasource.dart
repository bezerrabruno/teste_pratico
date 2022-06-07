abstract class StudentDatasource {
  Future<List> get();

  Future<List> add(Map student);
}
