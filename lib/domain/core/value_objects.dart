import 'package:equatable/equatable.dart';
import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';

abstract class ValueObject<T> extends Equatable {
  T get value;
  List<ValueFailures<String>> failures();

  @override
  List<Object?> get props => [value];
}

class UniqueId extends ValueObject<int?> {
  @override
  final int? value;

  UniqueId._(this.value);

  factory UniqueId(String value) => UniqueId._(int.tryParse(value));

  @override
  List<ValueFailures<String>> failures() => <ValueValidators<String, int?>>[
        ValidateUniqueIdIsNotNull(),
      ].validate(value);
}

extension ValueObjectX on ValueObject {
  String? validators() {
    final fails = failures();
    if (fails.isNotEmpty) {
      final msgFail = fails.map((e) => e.failedValue).join("\n");
      return msgFail;
    }
    return null;
  }
}
