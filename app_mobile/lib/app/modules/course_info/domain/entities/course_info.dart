class CourseInfo {
  int? id;
  String name;
  String? description;
  String? menu;
  int? enrollments;

  CourseInfo({
    this.id,
    required this.name,
    this.description,
    this.menu,
    this.enrollments,
  });
}
