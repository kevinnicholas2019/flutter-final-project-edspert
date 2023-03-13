import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

class StudentAnswer extends ValueObject<String> {
  @override
  final String value;

  StudentAnswer._(this.value);

  factory StudentAnswer(String value) => StudentAnswer._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class OptionImg extends ValueObject<String> {
  @override
  final String value;

  OptionImg._(this.value);

  factory OptionImg(String value) => OptionImg._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Option extends ValueObject<String> {
  @override
  final String value;

  Option._(this.value);

  factory Option(String value) => Option._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class QuestionTitleImg extends ValueObject<String> {
  @override
  final String value;

  QuestionTitleImg._(this.value);

  factory QuestionTitleImg(String value) => QuestionTitleImg._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class QuestionTitle extends ValueObject<String> {
  @override
  final String value;

  QuestionTitle._(this.value);

  factory QuestionTitle(String value) => QuestionTitle._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class ExerciseIdFk extends ValueObject<String> {
  @override
  final String value;

  ExerciseIdFk._(this.value);

  factory ExerciseIdFk(String value) => ExerciseIdFk._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}
