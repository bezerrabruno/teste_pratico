import 'package:app_mobile/app/modules/course_info/domain/entities/student_course.dart';

class StudentCourseModel extends StudentCourse {
  StudentCourseModel({
    required int id,
    required String name,
    required int age,
  }) : super(
          id: id,
          name: name,
          age: age,
        );

  static List<StudentCourseModel> fromMap(List map) {
    final List<StudentCourseModel> listStudent = [];

    for (Map row in map) {
      final student = StudentCourseModel(
        id: row['student_id'],
        name: row['name'],
        age: row['age'] ?? '',
      );
      listStudent.add(student);
    }
    return listStudent;
  }
}
