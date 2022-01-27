import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepperNextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  const StepperNextButtonWidget(
      {Key? key,
      required this.label,
      required this.onTap,
      this.isActive = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: isActive ? onTap : null,
        child: Text(
          label,
          style: isActive
              ? AppTheme.textStyles.stepperNextButton
              : AppTheme.textStyles.stepperNextButtonDisabled,
        ));
  }
}
