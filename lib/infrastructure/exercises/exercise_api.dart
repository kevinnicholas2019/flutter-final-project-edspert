import 'package:dio/dio.dart';
import 'package:final_project_edspert/domain/exercises/exercise.dart';
import 'package:final_project_edspert/domain/exercises/i_exercise_repository.dart';
import 'package:final_project_edspert/infrastructure/core/api.dart';
import 'package:final_project_edspert/infrastructure/exercises/exercise_dto.dart';

class ExerciseApi extends Api implements IExerciseRepository {
  @override
  String get apiForwardUrl => "/exercise/data_exercise";

  @override
  Future<List<Exercise>> getExercises(String courseId) async {
    final Response<Map> response = await dio.get(
        "$apiForwardUrl?course_id=$courseId&user_email=testerngbayu@gmail.com");
    final data = response.data;

    if (data == null) {
      throw Error();
    }
    final exercises = <Exercise>[];

    if (data["status"] == 1) {
      for (var exerciseJson in data["data"]) {
        exercises.add(ExerciseDto.fromJson(exerciseJson).toDomain());
      }
    }

    return exercises;
  }
}
