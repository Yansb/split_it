import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppGradients {
  Gradient get background;
  Gradient get eventOkayButton;
  Gradient get concludeNewEvent;
}

class AppGradientsDefault implements AppGradients {
  @override
  Gradient get background => const LinearGradient(
        colors: [Color(0XFF40B38C), Color(0XFF45CC93)],
        transform: GradientRotation(2.35619 * pi),
      );

  @override
  // linear-gradient(135deg, #40B38C 0%, #45CC93 100%);
  Gradient get eventOkayButton => const LinearGradient(
        colors: [Color(0XFF40B38C), Color(0XFF45CC93)],
        stops: [0.0, 1.0],
        transform: GradientRotation(2.35619),
      );

  @override
//linear-gradient(135deg, #40B38C 0%, #45CC93 100%)
  Gradient get concludeNewEvent => const LinearGradient(
        colors: [Color(0XFF40B38C), Color(0XFF45CC93)],
        stops: [0.0, 1.0],
        transform: GradientRotation(2.35619),
      );
}
