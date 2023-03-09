import 'package:dio/dio.dart';
import 'package:final_project_edspert/domain/courses/course.dart';
import 'package:final_project_edspert/domain/courses/i_course_repository.dart';
import 'package:final_project_edspert/infrastructure/core/api.dart';
import 'package:final_project_edspert/infrastructure/courses/course_dto.dart';

class CourseApi extends Api implements ICourseRepository {
  @override
  String get apiUrl => "${super.apiUrl}exercise/data_course";

  @override
  Future<List<Course>> getCourses() async {
    // final Response<Map> response = await dio.get(
    //     "$apiUrl?major_name=IPA&user_email=testerngbayu@gmail.com");
    // final Response<Map> response2 = await dio
    //     .get("$apiUrl?major_name=IPS&user_email=testerngbayu@gmail.com");
    final Response<Map> response2 = await dio
        .get("$apiUrl?major_name=IPA&user_email=testerngbayu@gmail.com");

    // final dataIpa = response.data;
    final dataIps = response2.data;

    if (
        // dataIpa == null || dataIps == null
        dataIps == null) {
      throw Error();
    }
    final courses = <Course>[];

    for (var courseJson in [
      // ...dataIpa["data"],
      ...dataIps["data"],
    ]) {
      courses.add(CourseDto.fromJson(courseJson).toDomain());
    }

    return courses;
  }

  @override
  Future<List<Course>> getCoursesByLimit(int limit) {
    // TODO: implement getCoursesByLimit
    throw UnimplementedError();
  }
}
