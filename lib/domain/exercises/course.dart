import 'package:equatable/equatable.dart';
import 'package:final_project_edspert/domain/core/entity.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/exercises/value_object.dart';

class Exercise extends Equatable implements IEntity {
  @override
  final UniqueId id;
  final ExerciseTitle exerciseTitle;
  final AccessType accessType;
  final Icon icon;
  final ExerciseUserStatus exerciseUserStatus;
  final JumlahSoal jumlahSoal;
  final JumlahDone jumlahDone;

  const Exercise({
    required this.id,
    required this.exerciseTitle,
    required this.accessType,
    required this.icon,
    required this.exerciseUserStatus,
    required this.jumlahSoal,
    required this.jumlahDone,
  });

  @override
  List<Object?> get props => [
        id.value,
      ];
}
