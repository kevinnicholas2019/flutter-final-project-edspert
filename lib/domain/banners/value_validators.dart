import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

final _urlRegex = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');

class IsUrlValid implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {InvalidUrlFail(): _urlRegex.hasMatch(value)};
}

class IsUrlKosong implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const KosongFail("URL"): value.isNotEmpty};
}
