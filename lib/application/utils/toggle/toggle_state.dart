part of 'toggle_bloc.dart';

@immutable
abstract class ToggleState {
  final Map<String, bool> _values;
  final String value;

  Map<String, bool> get values => _values;

  const ToggleState(Map<String, bool> values, this.value) : _values = values;
}

class ToggleInitial extends ToggleState {
  ToggleInitial(Map<String, bool> values, String keyValue)
      : super(
          values.map(
            (key, value) => MapEntry(key, key == keyValue),
          ),
          keyValue,
        );
}
