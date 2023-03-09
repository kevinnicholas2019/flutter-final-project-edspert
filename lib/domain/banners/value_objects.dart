import 'package:final_project_edspert/domain/banners/value_validators.dart';
import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

class Title implements ValueObject<String> {
  @override
  final String value;

  const Title._(this.value);

  factory Title(String value) => Title._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Description implements ValueObject<String> {
  @override
  final String value;

  const Description._(this.value);

  factory Description(String value) => Description._(value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Image implements ValueObject<String> {
  @override
  final String value;

  const Image._({required this.value});

  factory Image(String value) => Image._(value: value);

  @override
  List<ValueFailures<String>> failures() =>
      <ValueValidators<String, String>>[].validate(value);
}

class Url implements ValueObject<String> {
  @override
  final String value;

  const Url._({required this.value});

  factory Url(String value) => Url._(value: value);

  @override
  List<ValueFailures<String>> failures() => <ValueValidators<String, String>>[
        IsUrlKosong(),
        IsUrlValid(),
      ].validate(value);
}
