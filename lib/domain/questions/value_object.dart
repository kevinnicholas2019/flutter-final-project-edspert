import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

class StudentAnswer implements ValueObject<String> {
  @override
  final String value;

  const StudentAnswer._(this.value);

  factory StudentAnswer(String value) => StudentAnswer._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class OptionImg implements ValueObject<String> {
  @override
  final String value;

  const OptionImg._(this.value);

  factory OptionImg(String value) => OptionImg._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Option implements ValueObject<String> {
  @override
  final String value;

  const Option._(this.value);

  factory Option(String value) => Option._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class QuestionTitleImg implements ValueObject<String> {
  @override
  final String value;

  const QuestionTitleImg._(this.value);

  factory QuestionTitleImg(String value) => QuestionTitleImg._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class QuestionTitle implements ValueObject<String> {
  @override
  final String value;

  const QuestionTitle._(this.value);

  factory QuestionTitle(String value) => QuestionTitle._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class ExerciseIdFk implements ValueObject<String> {
  @override
  final String value;

  const ExerciseIdFk._(this.value);

  factory ExerciseIdFk(String value) => ExerciseIdFk._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}
