import '../../domain/entities/course.dart';

class CourseModel extends Course {
  CourseModel({
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

  static List<CourseModel> fromMap(List map) {
    final List<CourseModel> listCourse = [];

    for (Map row in map) {
      final course = CourseModel(
        id: row['id'],
        name: row['name'],
        description: row['description'] ?? '',
        menu: row['menu'] ?? '',
      );
      listCourse.add(course);
    }
    return listCourse;
  }

  static Map toMap(Course course) {
    return {
      'name': course.name,
      'description': course.description,
      'menu': course.menu,
    };
  }
}
