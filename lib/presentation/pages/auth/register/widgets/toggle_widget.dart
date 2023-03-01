import 'package:final_project_edspert/application/utils/toggle/toggle_bloc.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleWidget extends StatelessWidget {
  final Map<String, bool> values;

  const ToggleWidget({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    final ToggleBloc bloc = ToggleBloc(values);

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
                            side: BorderSide(
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
                              return coloring.withOpacity(0.375);
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
                              ? ColorsApp.secondary
                              : ColorsApp.background,
                        ),
                        textStyle: MaterialStatePropertyAll(
                          TextStyleApp.titleDefault18.copyWith(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      child: Text(
                        entry.key,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyleApp.largeTextDefault.copyWith(
                          fontSize: 14,
                          color: !entry.value
                              ? ColorsApp.titleActive
                              : ColorsApp.offWhite,
                        ),
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
