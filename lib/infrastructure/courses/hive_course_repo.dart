import 'package:final_project_edspert/domain/courses/course.dart';
import 'package:final_project_edspert/domain/courses/i_course_repository.dart';
import 'package:final_project_edspert/infrastructure/courses/course_dto.dart';
import 'package:hive_flutter/adapters.dart';

class HiveCourseRepo implements ICourseRepository {
  @override
  Future<List<Course>> getCourses() async {
    final courseBox = await Hive.openBox<Map>('course');

    var courses = <Course>[];
    for (var courseKey in courseBox.keys) {
      final course = courseBox.get(courseKey);
      if (course != null) {
        courses
            .add(CourseDto.fromJson(course.cast<String, dynamic>()).toDomain());
      }
    }

    await courseBox.close();

    return courses;
  }

  @override
  Future<List<Course>> getCoursesByLimit(int limit) async =>
      await getCourses().then((value) => value.take(3).toList());

  Future<void> saveCourses(List<Course> courses) async {
    final courseBox = await Hive.openBox<Map>('course');
    for (var course in courses) {
      final id = course.id.value.toString();
      final courseFromBox = courseBox.get(id);
      if (courseFromBox == null) {
        await courseBox.put(id, CourseDto.fromDomain(course).toJson());
      } else {
        var oldCourse =
            CourseDto.fromJson(courseFromBox.cast<String, dynamic>())
                .toDomain();
        if (course != oldCourse) {
          await courseBox.put(id, CourseDto.fromDomain(course).toJson());
        }
      }
    }
    await courseBox.close();
  }
}
