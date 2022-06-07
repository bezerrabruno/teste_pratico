import '../../domain/entities/student.dart';

class StudentModel extends Student {
  StudentModel({
    required int id,
    required String name,
    required int age,
  }) : super(
          id: id,
          name: name,
          age: age,
        );

  static List<StudentModel> fromMap(List map) {
    final List<StudentModel> liststudent = [];

    for (Map row in map) {
      final student = StudentModel(
        id: row['id'],
        name: row['name'],
        age: row['age'] ?? '',
      );
      liststudent.add(student);
    }
    return liststudent;
  }

  static Map toMap(Student student) {
    return {
      'name': student.name,
      'age': student.age,
    };
  }
}
