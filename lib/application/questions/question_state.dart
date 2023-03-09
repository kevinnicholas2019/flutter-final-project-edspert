part of 'question_bloc.dart';

@immutable
abstract class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionOnLoad extends QuestionState {}

class QuestionOnSuccess extends QuestionState {
  final List<dynamic> questions;

  QuestionOnSuccess({required this.questions});
}

class QuestionOnFail extends QuestionState {
  final String failedMsg;

  QuestionOnFail(this.failedMsg);
}
