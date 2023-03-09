import 'package:final_project_edspert/domain/exercises/course.dart';
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
      final courses = await _api.getExercises(courseId);
      if (courses.isNotEmpty) {
        await _repo.saveExercises(courseId, courses);
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return await _repo.getExercises(courseId);
  }
}
