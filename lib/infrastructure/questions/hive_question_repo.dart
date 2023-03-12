import 'package:final_project_edspert/domain/questions/i_question_repository.dart';
import 'package:hive_flutter/adapters.dart';

class HiveQuestionRepo implements IQuestionRepository {
  @override
  Future<List<Map<String, dynamic>>> getQuestions(String courseId) async {
    final questionBox =
        await Hive.openBox<List<Map<String, dynamic>>>('question');
    final questionsHive = questionBox.get(courseId);

    if (questionsHive == null) {
      return [];
    }

    await questionBox.close();

    return questionsHive;
  }

  Future<void> saveQuestions(String exerciseId, List<dynamic> questions) async {
    final questionBox = await Hive.openBox<List>('question');
    // final questionFromBox = questionBox.get(exerciseId);

    await questionBox.put(exerciseId, questions);

    // if (questionFromBox == null) {
    //   await questionBox.put(exerciseId, questions);
    // } else {
    //   // for (var question in questions) {
    //   //   final id = question.id.value.toString();
    //   //   if (questionFromBox[id] != null) {
    //   //     var oldQuestion =
    //   //         QuestionDto.fromJson(questionFromBox[id].cast<String, dynamic>())
    //   //             .toDomain();
    //   //     if (question != oldQuestion) {
    //   //       await questionBox.put(
    //   //           exerciseId,
    //   //           questions.asMap().map((key, value) => MapEntry(
    //   //               value.id.value.toString(),
    //   //               QuestionDto.fromDomain(value).toJson())));
    //   //       break;
    //   //     }
    //   //   }
    //   // }
    // }

    await questionBox.close();
  }
}
