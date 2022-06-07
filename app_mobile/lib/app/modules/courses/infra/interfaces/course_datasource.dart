abstract class CourseDatasource {
  Future<List> get();

  Future<List> add(Map course);
}
