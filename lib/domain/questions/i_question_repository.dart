import 'package:final_project_edspert/domain/questions/question.dart';
import 'package:final_project_edspert/infrastructure/questions/question_datasource.dart';

abstract class IQuestionRepository {
  static final IQuestionRepository _instance = QuestionsDataSource();
  factory IQuestionRepository() => _instance;

  Future<List<dynamic>> getQuestions(String exerciseId);
}
