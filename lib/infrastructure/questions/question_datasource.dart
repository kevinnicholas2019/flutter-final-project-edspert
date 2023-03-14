import 'package:final_project_edspert/domain/questions/i_question_repository.dart';
import 'package:final_project_edspert/domain/questions/question.dart';
import 'package:final_project_edspert/infrastructure/questions/hive_question_repo.dart';
import 'package:final_project_edspert/infrastructure/questions/question_api.dart';
import 'package:flutter/foundation.dart';

class QuestionsDataSource implements IQuestionRepository {
  final _api = QuestionApi();
  final _repo = HiveQuestionRepo();

  @override
  Future<List<Question>> getQuestions(String exerciseId) async {
    var questions = await _repo.getQuestions(exerciseId);
    if (questions.isEmpty) {
      try {
        final apiQuestions = await _api.getQuestions(exerciseId);
        await _repo.saveQuestions(exerciseId, apiQuestions);
        questions = await _repo.getQuestions(exerciseId);
      } catch (err) {
        if (kDebugMode) {
          print(err);
        }
      }
    }

    return questions;
  }
}
