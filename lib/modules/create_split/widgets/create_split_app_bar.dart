import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitAppBarWidget extends PreferredSize {
  final int pages;
  final VoidCallback iconButtonPress;
  final int currentPage;
  CreateSplitAppBarWidget({
    required this.pages,
    required this.iconButtonPress,
    required this.currentPage,
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
                      iconButtonPress();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppTheme.colors.backButton,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text.rich(TextSpan(
                      text: "0$currentPage",
                      style: AppTheme.textStyles.stepperIndicatorPrimary,
                      children: [
                        TextSpan(
                            text: " - 0$pages",
                            style:
                                AppTheme.textStyles.stepperIndicatorSecondary)
                      ])),
                )
              ],
            ),
          ),
        );
}
