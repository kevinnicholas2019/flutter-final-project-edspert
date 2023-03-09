import 'package:final_project_edspert/domain/courses/course.dart';
import 'package:final_project_edspert/infrastructure/courses/course_datasource.dart';

abstract class ICourseRepository {
  static final ICourseRepository _instance = CourseDataSource();
  factory ICourseRepository() => _instance;

  Future<List<Course>> getCourses();
  Future<List<Course>> getCoursesByLimit(int limit);
}
