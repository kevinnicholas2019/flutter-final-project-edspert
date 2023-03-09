import 'package:final_project_edspert/domain/questions/i_question_repository.dart';
import 'package:final_project_edspert/domain/questions/question.dart';
import 'package:final_project_edspert/infrastructure/questions/question_dto.dart';
import 'package:hive_flutter/adapters.dart';

class HiveQuestionRepo implements IQuestionRepository {
  @override
  Future<List<Question>> getQuestions(String courseId) async {
    final questionBox = await Hive.openBox<Map>('question');
    final questionsHive = questionBox.get(courseId);

    if (questionsHive == null) {
      return [];
    }

    var questions = <Question>[];
    for (var question in questionsHive.entries) {
      questions.add(QuestionDto.fromJson(question.value.cast<String, dynamic>())
          .toDomain());
    }

    await questionBox.close();

    return questions;
  }

  Future<void> saveQuestions(String courseId, List<Question> questions) async {
    final questionBox = await Hive.openBox<Map>('question');
    final questionFromBox = questionBox.get(courseId);

    if (questionFromBox == null) {
      await questionBox.put(
          courseId,
          questions.asMap().map((key, value) => MapEntry(
              value.id.value.toString(),
              QuestionDto.fromDomain(value).toJson())));
    } else {
      for (var question in questions) {
        final id = question.id.value.toString();
        if (questionFromBox[id] != null) {
          var oldQuestion =
              QuestionDto.fromJson(questionFromBox[id].cast<String, dynamic>())
                  .toDomain();
          if (question != oldQuestion) {
            await questionBox.put(
                courseId,
                questions.asMap().map((key, value) => MapEntry(
                    value.id.value.toString(),
                    QuestionDto.fromDomain(value).toJson())));
            break;
          }
        }
      }
    }

    await questionBox.close();
  }
}
