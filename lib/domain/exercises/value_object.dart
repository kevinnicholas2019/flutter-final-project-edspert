import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

class ExerciseTitle extends ValueObject<String> {
  @override
  final String value;

  ExerciseTitle._(this.value);

  factory ExerciseTitle(String value) => ExerciseTitle._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class AccessType extends ValueObject<String> {
  @override
  final String value;

  AccessType._(this.value);

  factory AccessType(String value) => AccessType._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Icon extends ValueObject<String> {
  @override
  final String value;

  Icon._(this.value);

  factory Icon(String value) => Icon._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class ExerciseUserStatus extends ValueObject<String> {
  @override
  final String value;

  ExerciseUserStatus._(this.value);

  factory ExerciseUserStatus(String value) => ExerciseUserStatus._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class JumlahSoal extends ValueObject<int> {
  @override
  final int value;

  JumlahSoal._({required this.value});

  factory JumlahSoal(int value) => JumlahSoal._(value: value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, int>>[].validate(value);
}

class JumlahDone extends ValueObject<int> {
  @override
  final int value;

  JumlahDone._({required this.value});

  factory JumlahDone(int value) => JumlahDone._(value: value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, int>>[].validate(value);
}
