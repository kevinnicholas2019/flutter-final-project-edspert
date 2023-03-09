import 'package:dio/dio.dart';
import 'package:final_project_edspert/domain/questions/i_question_repository.dart';
import 'package:final_project_edspert/domain/questions/question.dart';
import 'package:final_project_edspert/infrastructure/core/api.dart';
import 'package:final_project_edspert/infrastructure/questions/question_dto.dart';

class QuestionApi extends Api implements IQuestionRepository {
  @override
  String get apiUrl => "${super.apiUrl}exercise/data_exercise";

  @override
  Future<List<Question>> getQuestions(String courseId) async {
    final Response<Map> response = await dio
        .get("$apiUrl?course_id=$courseId&user_email=testerngbayu@gmail.com");
    final data = response.data;

    if (data == null) {
      throw Error();
    }
    final exercises = <Question>[];

    if (data["status"] == 1 && data["message"] == "ok") {
      for (var exerciseJson in data["data"]) {
        exercises.add(QuestionDto.fromJson(exerciseJson).toDomain());
      }
    }

    return exercises;
  }
}
