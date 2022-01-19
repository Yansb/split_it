import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundSplash;
  Color get homeTitle;
  Color get button;
  Color get backgroundPrimary;
  Color get border;
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
}
