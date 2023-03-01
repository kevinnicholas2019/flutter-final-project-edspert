import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc(Map<String, bool> values, [String value = ""])
      : super(ToggleInitial(values, value)) {
    on<ToggleEventOnPressed>((event, emit) {
      emit(ToggleInitial(state.values, event.keyPressed));
    });
  }
}
