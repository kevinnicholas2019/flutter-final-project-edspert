import 'package:final_project_edspert/domain/core/value_failures.dart';

class EmailNotValidFail implements ValueFailures<String> {
  @override
  String get failedValue => "Email tidak valid";
}
