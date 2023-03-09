import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/courses/course.dart';
import 'package:final_project_edspert/domain/courses/i_course_repository.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final ICourseRepository _repo = ICourseRepository();

  CourseBloc() : super(CourseInitial()) {
    on<OnGetCourses>((event, emit) async {
      emit(CourseOnLoad());
      try {
        final courses = await _repo.getCourses();
        emit(CourseOnSuccess(courses: courses));
      } catch (err) {
        emit(CourseOnFail(err.toString()));
      }
    });

    on<OnGetLimitCourses>((event, emit) async {
      emit(CourseOnLoad());
      try {
        final courses = await _repo.getCoursesByLimit(3);
        emit(CourseOnSuccess(courses: courses));
      } catch (err) {
        emit(CourseOnFail(err.toString()));
      }
    });
  }
}
