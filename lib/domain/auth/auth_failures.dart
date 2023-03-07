import 'package:final_project_edspert/domain/core/value_failures.dart';

abstract class AuthFail implements ValueFailures<String> {}

class AuthFailCancelled implements AuthFail {
  @override
  String get failedValue => "Cancelled by user";
}

class AuthFailServerError implements AuthFail {
  @override
  String get failedValue => "Server Error";
}
