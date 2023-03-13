import 'package:final_project_edspert/domain/courses/course.dart';
import 'package:final_project_edspert/domain/courses/i_course_repository.dart';
import 'package:final_project_edspert/infrastructure/core/api.dart';
import 'package:final_project_edspert/infrastructure/courses/course_dto.dart';

class CourseApi extends Api implements ICourseRepository {
  @override
  String get apiForwardUrl => "/exercise/data_course";

  @override
  Future<List<Course>> getCourses() async {
    var responses = await Future.wait([
      dio.get<Map>(
          "$apiForwardUrl?major_name=IPA&user_email=testerngbayu@gmail.com"),
      dio.get<Map>(
          "$apiForwardUrl?major_name=IPS&user_email=testerngbayu@gmail.com")
    ]);

    final courses = <Course>[];

    for (var response in responses) {
      var data = response.data;

      if (data == null) {
        // throw Error();
        continue;
      }

      if (data["status"] == 1) {
        courses.addAll([
          for (var thisData in data["data"])
            CourseDto.fromJson(thisData).toDomain()
        ]);
      }
    }

    return courses;
  }

  @override
  Future<List<Course>> getCoursesByLimit(int limit) async {
    return await getCourses().then((value) => value.take(3).toList());
  }
}
