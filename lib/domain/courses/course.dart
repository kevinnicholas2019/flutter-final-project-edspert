import 'package:equatable/equatable.dart';
import 'package:final_project_edspert/domain/core/entity.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/courses/value_object.dart';

class Course extends Equatable implements IEntity {
  @override
  final UniqueId id;
  final MajorName majorName;
  final CourseCategory courseCategory;
  final CourseName courseName;
  final UrlCover urlCover;
  final JumlahMateri jumlahMateri;
  final JumlahDone jumlahDone;
  final Progress progress;

  const Course({
    required this.id,
    required this.majorName,
    required this.courseCategory,
    required this.courseName,
    required this.urlCover,
    required this.jumlahMateri,
    required this.jumlahDone,
    required this.progress,
  });

  @override
  List<Object?> get props => [
        id,
        majorName,
        courseCategory,
        courseName,
        urlCover,
        jumlahMateri,
        jumlahDone,
        progress,
      ];
}
