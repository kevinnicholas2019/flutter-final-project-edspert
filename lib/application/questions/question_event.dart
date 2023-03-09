part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {}

class OnGetQuestions extends QuestionEvent {
  final String courseId;

  OnGetQuestions(this.courseId);
}
