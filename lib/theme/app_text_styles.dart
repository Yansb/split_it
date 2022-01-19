import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get title => GoogleFonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.homeTitle,
      );

  @override
  TextStyle get button => GoogleFonts.inter(
        color: AppTheme.colors.button,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
}
