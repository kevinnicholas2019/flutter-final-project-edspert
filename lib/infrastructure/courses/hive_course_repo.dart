import 'package:final_project_edspert/domain/courses/course.dart';
import 'package:final_project_edspert/domain/courses/i_course_repository.dart';
import 'package:final_project_edspert/infrastructure/courses/course_dto.dart';
import 'package:hive_flutter/adapters.dart';

class HiveCourseRepo implements ICourseRepository {
  @override
  Future<List<Course>> getCourses() async {
    final courseBox = await Hive.openBox<Map>('course');

    final List<Course> courses = courseBox.values
        .map((e) => CourseDto.fromJson(e.cast<String, dynamic>()).toDomain())
        .toList();

    await courseBox.close();

    return courses;
  }

  @override
  Future<List<Course>> getCoursesByLimit(int limit) async =>
      await getCourses().then((value) => value.take(3).toList());

  Future<void> saveCourses(List<Course> courses) async {
    final courseBox = await Hive.openBox<Map>('course');
    await courseBox.clear();
    await courseBox.addAll(
      courses.map((e) => CourseDto.fromDomain(e).toJson()).toList(),
    );
    await courseBox.close();
  }
}
