part of 'toggle_bloc.dart';

@immutable
abstract class ToggleEvent {}

class ToggleEventOnPressed implements ToggleEvent {
  final String keyPressed;

  ToggleEventOnPressed(this.keyPressed);
}
