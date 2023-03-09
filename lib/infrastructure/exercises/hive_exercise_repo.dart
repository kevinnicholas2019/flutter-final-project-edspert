import 'package:final_project_edspert/domain/exercises/course.dart';
import 'package:final_project_edspert/domain/exercises/i_exercise_repository.dart';
import 'package:final_project_edspert/infrastructure/exercises/exercise_dto.dart';
import 'package:hive_flutter/adapters.dart';

class HiveExerciseRepo implements IExerciseRepository {
  @override
  Future<List<Exercise>> getExercises(String courseId) async {
    final exerciseBox = await Hive.openBox<Map>('exercise');
    final exercisesHive = exerciseBox.get(courseId);

    if (exercisesHive == null) {
      return [];
    }

    var exercises = <Exercise>[];
    for (var exercise in exercisesHive.entries) {
      exercises.add(ExerciseDto.fromJson(exercise.value.cast<String, dynamic>())
          .toDomain());
    }

    await exerciseBox.close();

    return exercises;
  }

  Future<void> saveExercises(String courseId, List<Exercise> exercises) async {
    final exerciseBox = await Hive.openBox<Map>('exercise');
    final exerciseFromBox = exerciseBox.get(courseId);

    if (exerciseFromBox == null) {
      await exerciseBox.put(
          courseId,
          exercises.asMap().map((key, value) => MapEntry(
              value.id.value.toString(),
              ExerciseDto.fromDomain(value).toJson())));
    } else {
      for (var exercise in exercises) {
        final id = exercise.id.value.toString();
        if (exerciseFromBox[id] != null) {
          var oldExercise =
              ExerciseDto.fromJson(exerciseFromBox[id].cast<String, dynamic>())
                  .toDomain();
          if (exercise != oldExercise) {
            await exerciseBox.put(
                courseId,
                exercises.asMap().map((key, value) => MapEntry(
                    value.id.value.toString(),
                    ExerciseDto.fromDomain(value).toJson())));
            break;
          }
        }
      }
    }

    await exerciseBox.close();
  }
}
