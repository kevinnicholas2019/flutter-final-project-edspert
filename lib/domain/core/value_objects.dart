import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

abstract class ValueObject<T> {
  T get value;
  List<ValueFailures<String>> failures();
}

class UniqueId implements ValueObject<int?> {
  @override
  final int? value;

  UniqueId._(this.value);

  factory UniqueId(String value) => UniqueId._(int.tryParse(value));

  @override
  List<ValueFailures<String>> failures() => <ValueValidators<String, int?>>[
        ValidateUniqueIdIsNotNull(),
      ].validate(value);
}
