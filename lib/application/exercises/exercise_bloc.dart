import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/exercises/exercise.dart';
import 'package:final_project_edspert/domain/exercises/i_exercise_repository.dart';
import 'package:meta/meta.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final IExerciseRepository _repo = IExerciseRepository();

  ExerciseBloc() : super(ExerciseInitial()) {
    on<OnGetExercises>((event, emit) async {
      emit(ExerciseOnLoad());
      try {
        final exercises = await _repo.getExercises(event.courseId);
        emit(ExerciseOnSuccess(exercises: exercises));
      } catch (err) {
        emit(ExerciseOnFail(err.toString()));
      }
    });
  }
}
