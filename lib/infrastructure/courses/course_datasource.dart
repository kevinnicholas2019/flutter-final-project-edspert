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
    var courses = await _repo.getCourses();
    if (courses.isEmpty) {
      try {
        final apiCourses = await _api.getCourses();
        await _repo.saveCourses(apiCourses);
        courses = await _repo.getCourses();
      } catch (err) {
        if (kDebugMode) {
          print(err);
        }
      }
    }
    return courses;
  }

  @override
  Future<List<Course>> getCoursesByLimit(int limit) async {
    return await getCourses().then((value) => value.take(3).toList());
  }
}
