part of 'course_bloc.dart';

@immutable
abstract class CourseEvent {}

class OnGetCourses extends CourseEvent {}

class OnGetLimitCourses extends CourseEvent {}
