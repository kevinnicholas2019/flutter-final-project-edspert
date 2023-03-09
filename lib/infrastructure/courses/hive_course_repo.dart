import 'package:final_project_edspert/domain/courses/course.dart';
import 'package:final_project_edspert/domain/courses/i_course_repository.dart';
import 'package:final_project_edspert/infrastructure/courses/course_dto.dart';
import 'package:hive_flutter/adapters.dart';

class HiveCourseRepo implements ICourseRepository {
  @override
  Future<List<Course>> getCourses() async {
    final courseBox = await Hive.openBox<Map>('course');

    var courses = <Course>[];
    for (var course in courseBox.values) {
      courses
          .add(CourseDto.fromJson(course.cast<String, dynamic>()).toDomain());
    }

    await courseBox.close();

    return courses;
  }

  @override
  Future<List<Course>> getCoursesByLimit(int limit) async {
    final courseBox = await Hive.openBox<Map>('course');

    var courses = <Course>[];
    var index = 0;
    for (var course in courseBox.values) {
      courses
          .add(CourseDto.fromJson(course.cast<String, dynamic>()).toDomain());
      index++;
      if (index == limit) break;
    }

    await courseBox.close();

    return courses;
  }

  Future<void> saveCourses(List<Course> courses) async {
    final courseBox = await Hive.openBox<Map<String, dynamic>>('course');
    if (courseBox.isNotEmpty) {
      await courseBox.clear();
    }
    for (var course in courses) {
      await courseBox.add(CourseDto.fromDomain(course).toJson());
    }
    await courseBox.close();
  }
}
