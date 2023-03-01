import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc(Map<String, bool> values) : super(ToggleInitial(values)) {
    on<ToggleEventOnPressed>((event, emit) {
      emit(ToggleChange(state.values, event.keyPressed));
      emit(ToggleInitial(state.values));
    });
  }
}
