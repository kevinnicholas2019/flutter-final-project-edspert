import 'package:final_project_edspert/domain/banners/value_validators.dart';
import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

class Title extends ValueObject<String> {
  @override
  final String value;

  Title._(this.value);

  factory Title(String value) => Title._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Description extends ValueObject<String> {
  @override
  final String value;

  Description._(this.value);

  factory Description(String value) => Description._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Image extends ValueObject<String> {
  @override
  final String value;

  Image._({required this.value});

  factory Image(String value) => Image._(value: value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Url extends ValueObject<String> {
  @override
  final String value;

  Url._({required this.value});

  factory Url(String value) => Url._(value: value);

  @override
  List<ValueFailures<String>> failures() => <ValueValidators<String, String>>[
        IsUrlKosong(),
        IsUrlValid(),
      ].validate(value);
}
