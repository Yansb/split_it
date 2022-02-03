import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitAppBarWidget extends PreferredSize {
  final int pages;
  final CreateSplitController controller;
  final BuildContext context;
  CreateSplitAppBarWidget({
    required this.controller,
    required this.pages,
    required this.context,
    Key? key,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppTheme.colors.backButton,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Observer(
                    builder: (_) {
                      return Text.rich(TextSpan(
                          text: "0${controller.currentPage + 1}",
                          style: AppTheme.textStyles.stepperIndicatorPrimary,
                          children: [
                            TextSpan(
                                text: " - 0$pages",
                                style: AppTheme
                                    .textStyles.stepperIndicatorSecondary)
                          ]));
                    },
                  ),
                )
              ],
            ),
          ),
        );
}
