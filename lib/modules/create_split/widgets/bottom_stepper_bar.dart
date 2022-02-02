import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/widgets/stepper_next_button.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onPrevious;
  final CreateSplitController controller;
  const BottomStepperBarWidget({
    Key? key,
    required this.controller,
    required this.onPrevious,
  }) : super(key: key);

  void onTapNext() {
    if (controller.currentPage == 2) {
      controller.saveEvent();
    } else {
      controller.nextPage();
    }
  }

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
                Observer(builder: (_) {
                  return Expanded(
                      child: StepperNextButtonWidget(
                    isActive: controller.currentPage > 0,
                    label: "Cancelar",
                    onTap: onPrevious,
                  ));
                }),
                Container(
                  width: 1,
                  height: 60,
                  color: AppTheme.colors.divider,
                ),
                Observer(builder: (_) {
                  return Expanded(
                      child: StepperNextButtonWidget(
                    isActive: controller.enableNavigateButton,
                    label:
                        controller.currentPage == 2 ? "Finalizar" : "Continuar",
                    onTap: onTapNext,
                  ));
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
