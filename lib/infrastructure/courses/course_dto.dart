import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/courses/course.dart';
import 'package:final_project_edspert/domain/courses/value_object.dart';

class CourseDto {
  final String courseId;
  final String majorName;
  final String courseCategory;
  final String courseName;
  final String urlCover;
  final int jumlahMateri;
  final int jumlahDone;
  final int progress;

  const CourseDto._({
    required this.courseId,
    required this.majorName,
    required this.courseCategory,
    required this.courseName,
    required this.urlCover,
    required this.jumlahMateri,
    required this.jumlahDone,
    required this.progress,
  });

  factory CourseDto.fromJson(Map<String, dynamic> json) => CourseDto._(
        courseId: json['course_id'] as String,
        majorName: json['major_name'] as String,
        courseCategory: json['course_category'] as String,
        courseName: json['course_name'] as String,
        urlCover: json['url_cover'] as String,
        jumlahMateri: json['jumlah_materi'] as int,
        jumlahDone: json['jumlah_done'] as int,
        progress: json['progress'] as int,
      );

  factory CourseDto.fromDomain(Course course) {
    return CourseDto._(
      courseId: course.id.value.toString(),
      majorName: course.majorName.value,
      courseCategory: course.courseCategory.value,
      courseName: course.courseName.value,
      urlCover: course.urlCover.value,
      jumlahMateri: course.jumlahMateri.value,
      jumlahDone: course.jumlahDone.value,
      progress: course.progress.value,
    );
  }

  Course toDomain() {
    return Course(
      id: UniqueId(courseId),
      majorName: MajorName(majorName),
      courseCategory: CourseCategory(courseCategory),
      courseName: CourseName(courseName),
      urlCover: UrlCover(urlCover),
      jumlahMateri: JumlahMateri(jumlahMateri),
      jumlahDone: JumlahDone(jumlahDone),
      progress: Progress(progress),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "course_id": courseId,
      "major_name": majorName,
      "course_category": courseCategory,
      "course_name": courseName,
      "url_cover": urlCover,
      "jumlah_materi": jumlahMateri,
      "jumlah_done": jumlahDone,
      "progress": progress,
    };
  }
}
