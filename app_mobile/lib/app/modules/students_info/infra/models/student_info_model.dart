import '../../domain/entities/student_info.dart';

class StudentInfoModel extends StudentInfo {
  StudentInfoModel({
    required int id,
    required String name,
    required int age,
  }) : super(
          id: id,
          name: name,
          age: age,
        );

  static StudentInfoModel fromMap(Map map) {
    return StudentInfoModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }

  static Map toMap(StudentInfo course) {
    return {
      'name': course.name,
      'age': course.age,
    };
  }
}
