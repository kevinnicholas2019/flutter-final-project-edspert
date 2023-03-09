part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseOnLoad extends CourseState {}

class CourseOnSuccess extends CourseState {
  final List<Course> courses;

  CourseOnSuccess({required this.courses});
}

class CourseOnFail extends CourseState {
  final String failedMsg;

  CourseOnFail(this.failedMsg);
}
