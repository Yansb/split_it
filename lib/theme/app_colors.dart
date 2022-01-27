import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundSplash;
  Color get homeTitle;
  Color get button;
  Color get backgroundPrimary;
  Color get border;
  Color get border2;
  Color get plusIcon;
  Color get infoCardTitle;
  Color get infoCardSubTitle1;
  Color get infoCardSubTitle2;
  Color get titleAppBar;
  Color get iconBackground1;
  Color get iconBackground2;
  Color get eventTileTitle;
  Color get eventTileSubtitle;
  Color get eventTileMoney;
  Color get eventTilePeople;
  Color get divider;
  Color get stepperIndicatorPrimary;
  Color get stepperIndicatorSecondary;
  Color get backButton;
  Color get stepperNextButton;
  Color get stepperNextButtonDisabled;
  Color get stepperTitle;
  Color get stepperDescription;
  Color get hintTextField;
  Color get textField;
  Color get inputBorder;
}

class AppColorsDefault implements AppColors {
  @override
  Color get backgroundPrimary => const Color(0xFFFFFFFF);

  @override
  Color get homeTitle => const Color(0XFF40B28C);

  @override
  Color get button => const Color(0XFF666666);

  @override
  Color get backgroundSplash => const Color(0xFF40B38C);

  @override
  Color get border => const Color(0XFFDCE0E6);

  @override
  Color get border2 => const Color(0XFFFFFFFF);

  @override
  Color get plusIcon => const Color(0XFFFFFFFF);

  @override
  Color get titleAppBar => const Color(0XFFFFFFFF);

  @override
  Color get iconBackground1 => const Color(0XFFE9F8F2);

  @override
  Color get iconBackground2 => const Color(0XFFFDECEF);

  @override
  Color get infoCardTitle => const Color(0XFF666666);

  @override
  Color get infoCardSubTitle1 => const Color(0XFF40B28C);

  @override
  Color get infoCardSubTitle2 => const Color(0XFFE83F5B);

  @override
  Color get eventTileMoney => const Color(0XFF666666);

  @override
  Color get eventTilePeople => const Color(0XFFA4B2AE);

  @override
  Color get eventTileSubtitle => const Color(0XFF666666);

  @override
  Color get eventTileTitle => const Color(0XFF455250);

  @override
  Color get divider => const Color(0XFF666666);

  @override
  Color get stepperIndicatorPrimary => const Color(0xFF3CAB82);

  @override
  Color get stepperIndicatorSecondary => const Color(0xFF666666);

  @override
  Color get backButton => const Color(0xFF666666);

  @override
  Color get stepperNextButton => const Color(0XFF455250);

  @override
  Color get stepperNextButtonDisabled => const Color(0XFF666666);

  @override
  Color get stepperDescription => const Color(0XFF455250);

  @override
  Color get stepperTitle => const Color(0XFF455250);

  @override
  Color get hintTextField => const Color(0XFF666666);

  @override
  Color get textField => const Color(0XFF455250);

  @override
  Color get inputBorder => const Color(0xFF455250);
}
