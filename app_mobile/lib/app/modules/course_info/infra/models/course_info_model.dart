import '../../domain/entities/course_info.dart';

class CourseInfoModel extends CourseInfo {
  CourseInfoModel({
    required int id,
    required String name,
    required String description,
    required String menu,
    required int enrollments,
  }) : super(
          id: id,
          name: name,
          description: description,
          menu: menu,
          enrollments: enrollments,
        );

  static CourseInfoModel fromMap(Map map) {
    return CourseInfoModel(
      id: map['id'],
      name: map['name'],
      description: map['description'] ?? '',
      menu: map['menu'] ?? '',
      enrollments: 0,
    );
  }

  static Map toMap(CourseInfo course) {
    return {
      'name': course.name,
      'description': course.description,
      'menu': course.menu,
    };
  }
}
