import 'package:final_project_edspert/domain/questions/i_question_repository.dart';
import 'package:final_project_edspert/domain/questions/question.dart';
import 'package:final_project_edspert/infrastructure/questions/hive_question_repo.dart';
import 'package:final_project_edspert/infrastructure/questions/question_api.dart';
import 'package:flutter/foundation.dart';

class QuestionsDataSource implements IQuestionRepository {
  final _api = QuestionApi();
  final _repo = HiveQuestionRepo();

  @override
  Future<List<dynamic>> getQuestions(String exerciseId) async {
    try {
      final courses = await _api.getQuestions(exerciseId);
      if (courses.isNotEmpty) {
        await _repo.saveQuestions(exerciseId, courses);
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return await _repo.getQuestions(exerciseId);
  }
}
