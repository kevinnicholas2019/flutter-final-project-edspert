import 'package:final_project_edspert/domain/exercises/exercise.dart';
import 'package:final_project_edspert/domain/exercises/i_exercise_repository.dart';
import 'package:final_project_edspert/infrastructure/exercises/exercise_api.dart';
import 'package:final_project_edspert/infrastructure/exercises/hive_exercise_repo.dart';
import 'package:flutter/foundation.dart';

class ExerciseDataSource implements IExerciseRepository {
  final _api = ExerciseApi();
  final _repo = HiveExerciseRepo();

  @override
  Future<List<Exercise>> getExercises(String courseId) async {
    var exercises = await _repo.getExercises(courseId);
    if (exercises.isEmpty) {
      try {
        final apiExercises = await _api.getExercises(courseId);
        await _repo.saveExercises(courseId, apiExercises);
        exercises = await _repo.getExercises(courseId);
      } catch (err) {
        if (kDebugMode) {
          print(err);
        }
      }
    }
    return exercises;
  }
}
