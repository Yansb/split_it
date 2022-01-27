import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/stepper_next_button.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool isNextEnabled;
  final bool isPreviousEnabled;
  const BottomStepperBarWidget(
      {Key? key,
      required this.onPrevious,
      required this.onNext,
      this.isNextEnabled = false,
      this.isPreviousEnabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: StepperNextButtonWidget(
                  isActive: isPreviousEnabled,
                  label: "Cancelar",
                  onTap: onPrevious,
                )),
                Container(
                  width: 1,
                  height: 60,
                  color: AppTheme.colors.divider,
                ),
                Expanded(
                    child: StepperNextButtonWidget(
                  isActive: isNextEnabled,
                  label: "Continuar",
                  onTap: onNext,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
