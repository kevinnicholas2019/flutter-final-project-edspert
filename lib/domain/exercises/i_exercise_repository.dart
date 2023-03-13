import 'package:final_project_edspert/domain/exercises/exercise.dart';
import 'package:final_project_edspert/infrastructure/exercises/exercise_datasource.dart';

abstract class IExerciseRepository {
  static final IExerciseRepository _instance = ExerciseDataSource();
  factory IExerciseRepository() => _instance;

  Future<List<Exercise>> getExercises(String courseId);
}
