import '../../domain/entities/course_student.dart';

class CourseStudentModel extends CourseStudent {
  CourseStudentModel({
    required int id,
    required String name,
    required String description,
    required String menu,
  }) : super(
          id: id,
          name: name,
          description: description,
          menu: menu,
        );

  static List<CourseStudent> fromMap(List map) {
    final List<CourseStudent> listStudent = [];

    for (Map row in map) {
      final student = CourseStudent(
        id: row['student_id'],
        name: row['name'],
        description: row['description'] ?? '',
        menu: row['menu'] ?? '',
      );
      listStudent.add(student);
    }
    return listStudent;
  }
}
