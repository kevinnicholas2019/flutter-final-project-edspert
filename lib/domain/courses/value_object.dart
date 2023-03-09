import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

class MajorName implements ValueObject<String> {
  @override
  final String value;

  const MajorName._(this.value);

  factory MajorName(String value) => MajorName._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class CourseName implements ValueObject<String> {
  @override
  final String value;

  const CourseName._(this.value);

  factory CourseName(String value) => CourseName._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class CourseCategory implements ValueObject<String> {
  @override
  final String value;

  const CourseCategory._(this.value);

  factory CourseCategory(String value) => CourseCategory._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class UrlCover implements ValueObject<String> {
  @override
  final String value;

  const UrlCover._(this.value);

  factory UrlCover(String value) => UrlCover._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class JumlahMateri implements ValueObject<int> {
  @override
  final int value;

  const JumlahMateri._({required this.value});

  factory JumlahMateri(int value) => JumlahMateri._(value: value);

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

class Progress implements ValueObject<int> {
  @override
  final int value;

  const Progress._({required this.value});

  factory Progress(int value) => Progress._(value: value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, int>>[].validate(value);
}
