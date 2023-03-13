import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

class MajorName extends ValueObject<String> {
  @override
  final String value;

  MajorName._(this.value);

  factory MajorName(String value) => MajorName._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class CourseName extends ValueObject<String> {
  @override
  final String value;

  CourseName._(this.value);

  factory CourseName(String value) => CourseName._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class CourseCategory extends ValueObject<String> {
  @override
  final String value;

  CourseCategory._(this.value);

  factory CourseCategory(String value) => CourseCategory._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class UrlCover extends ValueObject<String> {
  @override
  final String value;

  UrlCover._(this.value);

  factory UrlCover(String value) => UrlCover._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class JumlahMateri extends ValueObject<int> {
  @override
  final int value;

  JumlahMateri._({required this.value});

  factory JumlahMateri(int value) => JumlahMateri._(value: value);

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

class Progress extends ValueObject<int> {
  @override
  final int value;

  Progress._({required this.value});

  factory Progress(int value) => Progress._(value: value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, int>>[].validate(value);
}
