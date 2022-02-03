import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitSuccessPage extends StatelessWidget {
  final CreateSplitController controller;
  final NumberFormater formater;
  const CreateSplitSuccessPage(
      {Key? key, required this.controller, required this.formater})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppTheme.gradients.concludeNewEvent),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Money.png",
              width: 240,
              height: 240,
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              "${controller.event.friends.length} pessoas",
              style: AppTheme.textStyles.button
                  .copyWith(color: AppTheme.colors.backgroundPrimary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "R\$ ${formater.currencyFormatter(controller.event.valueSplit)}",
              style: AppTheme.textStyles.title
                  .copyWith(color: AppTheme.colors.backgroundPrimary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Para cada um",
              style: AppTheme.textStyles.button
                  .copyWith(color: AppTheme.colors.backgroundPrimary),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.event.friends
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(e.photoUrl),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    )
                    .toList()),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Ink(
            decoration:
                BoxDecoration(gradient: AppTheme.gradients.eventOkayButton),
            height: 76,
            child: Center(
              child: Text(
                "OKAY :D",
                style: AppTheme.textStyles.stepperNextButton
                    .copyWith(color: AppTheme.colors.backgroundPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
