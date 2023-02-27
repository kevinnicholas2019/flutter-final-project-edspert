import 'package:final_project_edspert/domain/core/value_failures.dart';

abstract class ValueObject<T> {
  const ValueObject();

  T get value;
  ValueFailures<T>? get fail;
}
