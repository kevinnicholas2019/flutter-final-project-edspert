import 'package:dio/dio.dart';
import 'package:final_project_edspert/domain/questions/i_question_repository.dart';
import 'package:final_project_edspert/domain/questions/question.dart';
import 'package:final_project_edspert/infrastructure/core/api.dart';
import 'package:final_project_edspert/infrastructure/questions/question_dto.dart';

class QuestionApi extends Api implements IQuestionRepository {
  @override
  String get apiUrl => "${super.apiUrl}exercise/kerjakan";

  @override
  Future<List<dynamic>> getQuestions(String exerciseId) async {
    FormData formData = FormData.fromMap({
      "exercise_id": exerciseId,
      "user_email": "testerngbayu@gmail.com",
    });
    final Response<Map> response = await dio.post(
      apiUrl,
      data: formData,
    );
    final data = response.data;

    if (data == null) {
      throw Error();
    }
    // final questions = <Question>[];

    if (data["status"] == 1) {
      // for (var questionJson in data["data"]) {
      //   questions.add(QuestionDto.fromJson(questionJson).toDomain());
      // }
      return data["data"];
    }

    return [];
  }
}
