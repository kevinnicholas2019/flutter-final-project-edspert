import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/exercises/exercise.dart';
import 'package:final_project_edspert/domain/exercises/value_object.dart';

class ExerciseDto {
  final String exerciseId;
  final String exerciseTitle;
  final String accessType;
  final String icon;
  final String exerciseUserStatus;
  final String jumlahSoal;
  final int jumlahDone;

  const ExerciseDto._({
    required this.exerciseId,
    required this.exerciseTitle,
    required this.accessType,
    required this.icon,
    required this.exerciseUserStatus,
    required this.jumlahSoal,
    required this.jumlahDone,
  });

  factory ExerciseDto.fromJson(Map<String, dynamic> json) => ExerciseDto._(
        exerciseId: json["exercise_id"] as String,
        exerciseTitle: json["exercise_title"] as String,
        accessType: json["access_type"] as String,
        icon: json["icon"] as String,
        exerciseUserStatus: json["exercise_user_status"] as String,
        jumlahSoal: json["jumlah_soal"] as String,
        jumlahDone: json["jumlah_done"] as int,
      );

  factory ExerciseDto.fromDomain(Exercise exercise) {
    return ExerciseDto._(
      exerciseId: exercise.id.value.toString(),
      exerciseTitle: exercise.exerciseTitle.value,
      accessType: exercise.accessType.value,
      icon: exercise.icon.value,
      exerciseUserStatus: exercise.exerciseUserStatus.value,
      jumlahSoal: exercise.jumlahSoal.value.toString(),
      jumlahDone: exercise.jumlahDone.value,
    );
  }

  Exercise toDomain() {
    return Exercise(
      id: UniqueId(exerciseId),
      exerciseTitle: ExerciseTitle(exerciseTitle),
      accessType: AccessType(accessType),
      icon: Icon(icon),
      exerciseUserStatus: ExerciseUserStatus(exerciseUserStatus),
      jumlahSoal: JumlahSoal(int.parse(jumlahSoal)),
      jumlahDone: JumlahDone(jumlahDone),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "exercise_id": exerciseId,
      "exercise_title": exerciseTitle,
      "access_type": accessType,
      "icon": icon,
      "exercise_user_status": exerciseUserStatus,
      "jumlah_soal": jumlahSoal,
      "jumlah_done": jumlahDone,
    };
  }
}
