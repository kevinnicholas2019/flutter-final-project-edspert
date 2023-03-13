import 'package:final_project_edspert/domain/exercises/exercise.dart';
import 'package:final_project_edspert/domain/exercises/i_exercise_repository.dart';
import 'package:final_project_edspert/infrastructure/exercises/exercise_dto.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/foundation.dart';

class HiveExerciseRepo implements IExerciseRepository {
  @override
  Future<List<Exercise>> getExercises(String courseId) async {
    final exerciseBox = await Hive.openBox<List>('exercise');
    final exercisesHive = exerciseBox.get(courseId);

    if (exercisesHive == null) {
      return [];
    }

    final results = exercisesHive
        .map((e) => ExerciseDto.fromJson(e.cast<String, dynamic>()).toDomain())
        .toList();

    await exerciseBox.close();

    return results;
  }

  Future<void> saveExercises(String courseId, List<Exercise> exercises) async {
    final exerciseBox = await Hive.openBox<List>('exercise');
    final exerciseFromBox = exerciseBox.get(courseId);
    final List<Exercise> exerciseFromHive = exerciseFromBox != null
        ? exerciseFromBox
            .map((e) =>
                ExerciseDto.fromJson(e.cast<String, dynamic>()).toDomain())
            .toList()
        : [];

    if (exerciseFromBox == null ||
        listEquals(exerciseFromHive, exercises) == false) {
      await exerciseBox.put(
        courseId,
        exercises.map((e) => ExerciseDto.fromDomain(e).toJson()).toList(),
      );
    }

    await exerciseBox.close();
  }
}
