import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepperNextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final bool colored;
  const StepperNextButtonWidget(
      {Key? key,
      required this.label,
      required this.onTap,
      this.isActive = true,
      this.colored = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: isActive ? onTap : null,
        child: SizedBox(
          height: 60,
          child: Center(
            child: Text(
              label,
              style: isActive
                  ? AppTheme.textStyles.stepperNextButton.copyWith(
                      color: colored
                          ? AppTheme.colors.iconAdd
                          : AppTheme.colors.stepperNextButton)
                  : AppTheme.textStyles.stepperNextButtonDisabled,
            ),
          ),
        ));
  }
}
