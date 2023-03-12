import 'package:dio/dio.dart';
import 'package:final_project_edspert/domain/questions/i_question_repository.dart';
import 'package:final_project_edspert/infrastructure/core/api.dart';

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

    if (data["status"] == 1) {
      return data["data"];
    }

    return [];
  }
}