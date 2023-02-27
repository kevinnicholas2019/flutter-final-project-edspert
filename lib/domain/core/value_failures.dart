abstract class ValueFailures<T> {
  const ValueFailures();

  T get failedValue;
}

class UniqueIdParseFail implements ValueFailures<String> {
  @override
  String get failedValue =>
      "(UniqueIdParseFail) ID parse error fromString method";
}
