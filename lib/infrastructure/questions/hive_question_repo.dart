import 'package:final_project_edspert/domain/questions/i_question_repository.dart';
import 'package:final_project_edspert/domain/questions/question.dart';
import 'package:final_project_edspert/infrastructure/questions/question_dto.dart';
import 'package:hive_flutter/adapters.dart';

class HiveQuestionRepo implements IQuestionRepository {
  @override
  Future<List<Question>> getQuestions(String exerciseId) async {
    final questionBox = await Hive.openBox<List>('question');
    final questionsHive = questionBox.get(exerciseId);

    await questionBox.close();

    if (questionsHive == null) {
      return [];
    }

    return questionsHive
        .map((e) => QuestionDto.fromJson(e).toDomain())
        .toList();
  }

  Future<void> saveQuestions(
      String exerciseId, List<Question> questions) async {
    final questionBox = await Hive.openBox<List>('question');

    await questionBox.put(exerciseId, questions);

    await questionBox.close();
  }
}
