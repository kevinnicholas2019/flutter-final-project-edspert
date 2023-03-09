import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

class ExerciseTitle implements ValueObject<String> {
  @override
  final String value;

  const ExerciseTitle._(this.value);

  factory ExerciseTitle(String value) => ExerciseTitle._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class AccessType implements ValueObject<String> {
  @override
  final String value;

  const AccessType._(this.value);

  factory AccessType(String value) => AccessType._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Icon implements ValueObject<String> {
  @override
  final String value;

  const Icon._(this.value);

  factory Icon(String value) => Icon._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class ExerciseUserStatus implements ValueObject<String> {
  @override
  final String value;

  const ExerciseUserStatus._(this.value);

  factory ExerciseUserStatus(String value) => ExerciseUserStatus._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class JumlahSoal implements ValueObject<int> {
  @override
  final int value;

  const JumlahSoal._({required this.value});

  factory JumlahSoal(int value) => JumlahSoal._(value: value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, int>>[].validate(value);
}

class JumlahDone implements ValueObject<int> {
  @override
  final int value;

  const JumlahDone._({required this.value});

  factory JumlahDone(int value) => JumlahDone._(value: value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, int>>[].validate(value);
}
