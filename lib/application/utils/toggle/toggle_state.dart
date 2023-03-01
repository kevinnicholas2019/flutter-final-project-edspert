part of 'toggle_bloc.dart';

@immutable
abstract class ToggleState {
  final Map<String, bool> values;

  const ToggleState(this.values);
}

class ToggleInitial extends ToggleState {
  const ToggleInitial(super.values);
}

class ToggleChange extends ToggleState {
  final String keyPressed;

  ToggleChange(Map<String, bool> values, this.keyPressed)
      : super(
          values.map(
            (key, value) => MapEntry(key, key == keyPressed),
          ),
        );
}
