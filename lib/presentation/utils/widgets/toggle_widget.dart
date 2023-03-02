import 'package:final_project_edspert/application/utils/toggle/toggle_bloc.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleWidget extends StatelessWidget {
  final ToggleBloc bloc;
  const ToggleWidget({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleBloc, ToggleState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is ToggleInitial) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...[
                for (var entry in state.values.entries) ...[
                  Expanded(
                    child: TextButton(
                      onPressed: () => !entry.value
                          ? bloc.add(ToggleEventOnPressed(entry.key))
                          : () {}(),
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.all(12),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: ColorsApp.line,
                            ),
                            borderRadius: BorderApp.radius,
                          ),
                        ),
                        overlayColor: MaterialStateColor.resolveWith(
                          (states) {
                            const Set<MaterialState> interactiveStates =
                                <MaterialState>{
                              MaterialState.pressed,
                            };

                            final coloring = entry.value
                                ? ColorsApp.background
                                : ColorsApp.secondary;

                            if (states.any(interactiveStates.contains)) {
                              return coloring.withOpacity(0.3);
                            }
                            return coloring.withOpacity(0.25);
                          },
                        ),
                        iconColor: MaterialStateColor.resolveWith(
                          (states) {
                            return Colors.black.withOpacity(0.5);
                          },
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          entry.value
                              ? ColorsApp.primary
                              : ColorsApp.background,
                        ),
                        foregroundColor: MaterialStateColor.resolveWith(
                          (states) {
                            const Set<MaterialState> interactiveStates =
                                <MaterialState>{
                              MaterialState.pressed,
                            };
                            if (states.any(interactiveStates.contains)) {
                              return entry.value
                                  ? ColorsApp.titleActive
                                  : ColorsApp.offWhite;
                            }
                            return !entry.value
                                ? ColorsApp.titleActive
                                : ColorsApp.offWhite;
                          },
                        ),
                        textStyle: MaterialStatePropertyAll(
                          TextStyleApp.largeTextDefault.copyWith(
                            fontSize: 14,
                            color: !entry.value
                                ? ColorsApp.titleActive
                                : ColorsApp.offWhite,
                          ),
                        ),
                      ),
                      child: Text(
                        entry.key,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (state.values.entries.last != entry)
                    const SizedBox(width: 9.02),
                ],
              ],
            ],
          );
        }

        return Row(
          children: const [],
        );
      },
    );
  }
}
