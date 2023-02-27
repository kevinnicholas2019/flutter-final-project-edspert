import 'package:final_project_edspert/domain/core/value_failures.dart';

abstract class ValueValidators<T, K> {
  Map<ValueFailures<T>, bool> validate(K value);
}

class ValidateUniqueIdIsNotNull implements ValueValidators<String, int?> {
  @override
  Map<ValueFailures<String>, bool> validate(int? value) =>
      {UniqueIdParseFail(): value != null};
}

extension ValueValidatorsX<T, K> on List<ValueValidators<T, K>> {
  List<ValueFailures<T>> validate(K value) {
    final errors = <ValueFailures<T>>[];
    for (var e in this) {
      final validator = e.validate(value);
      if (validator.values.first == false) {
        errors.add(validator.keys.first);
      }
    }
    return errors;
  }
}
