part of 'exercise_bloc.dart';

@immutable
abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class ExerciseOnLoad extends ExerciseState {}

class ExerciseOnSuccess extends ExerciseState {
  final List<Exercise> exercises;

  ExerciseOnSuccess({required this.exercises});
}

class ExerciseOnFail extends ExerciseState {
  final String failedMsg;

  ExerciseOnFail(this.failedMsg);
}
