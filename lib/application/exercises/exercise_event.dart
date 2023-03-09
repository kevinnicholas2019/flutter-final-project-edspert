part of 'exercise_bloc.dart';

@immutable
abstract class ExerciseEvent {}

class OnGetExercises extends ExerciseEvent {
  final String courseId;

  OnGetExercises(this.courseId);
}
