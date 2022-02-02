import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/theme/app_theme.dart';

class StepFour extends StatelessWidget {
  final CreateSplitController controller;
  final NumberFormater formater;
  const StepFour({Key? key, required this.controller, required this.formater})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundSplash,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Money.png",
          ),
          Text("${controller.event.friends.length} pessoas"),
          Text(
              "R\$ ${formater.currencyFormatter(controller.event.valueSplit)}"),
          const Text("Para cada um"),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.event.friends
                  .map(
                    (e) => Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image:
                              DecorationImage(image: NetworkImage(e.photoUrl))),
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
