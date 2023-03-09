import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/questions/i_question_repository.dart';
import 'package:final_project_edspert/domain/questions/question.dart';
import 'package:meta/meta.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final IQuestionRepository _repo = IQuestionRepository();

  QuestionBloc() : super(QuestionInitial()) {
    on<OnGetQuestions>((event, emit) async {
      emit(QuestionOnLoad());
      try {
        final questions = await _repo.getQuestions(event.courseId);
        emit(QuestionOnSuccess(questions: questions));
      } catch (err) {
        emit(QuestionOnFail(err.toString()));
      }
    });
  }
}
