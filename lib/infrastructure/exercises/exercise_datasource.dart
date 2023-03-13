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
    try {
      final exercises = await _api.getExercises(courseId);
      if (exercises.isNotEmpty) {
        await _repo.saveExercises(courseId, exercises);
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return await _repo.getExercises(courseId);
  }
}
