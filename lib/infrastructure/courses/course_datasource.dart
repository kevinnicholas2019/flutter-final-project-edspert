import 'package:final_project_edspert/domain/courses/course.dart';
import 'package:final_project_edspert/domain/courses/i_course_repository.dart';
import 'package:final_project_edspert/infrastructure/courses/course_api.dart';
import 'package:final_project_edspert/infrastructure/courses/hive_course_repo.dart';
import 'package:flutter/foundation.dart';

class CourseDataSource implements ICourseRepository {
  final _api = CourseApi();
  final _repo = HiveCourseRepo();

  @override
  Future<List<Course>> getCourses() async {
    try {
      final courses = await _api.getCourses();
      if (courses.isNotEmpty) {
        await _repo.saveCourses(courses);
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return await _repo.getCourses();
  }

  @override
  Future<List<Course>> getCoursesByLimit(int limit) async {
    try {
      final courses = await _api.getCourses();
      if (courses.isNotEmpty) {
        await _repo.saveCourses(courses);
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return await _repo.getCoursesByLimit(limit);
  }
}
