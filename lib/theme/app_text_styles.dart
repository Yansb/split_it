import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get appBar;
  TextStyle get infoCardTitle;
  TextStyle get infoCardSubTitle1;
  TextStyle get infoCardSubTitle2;
  TextStyle get eventTileTitle;
  TextStyle get eventTileSubtitle;
  TextStyle get eventTileMoney;
  TextStyle get eventTilePeople;
  TextStyle get stepperIndicatorPrimary;
  TextStyle get stepperIndicatorSecondary;
  TextStyle get stepperNextButton;
  TextStyle get stepperNextButtonDisabled;
  TextStyle get stepperTitle;
  TextStyle get stepperDescription;
  TextStyle get hintTextField;
  TextStyle get textField;
  TextStyle get detailsTitle;
  TextStyle get detailsPositiveSubtitle;
  TextStyle get detailsPositiveSubtitleBold;
  TextStyle get detailsNegativeSubtitle;
  TextStyle get detailsNegativeSubtitleBold;
  TextStyle get detailsSubtitle;
  TextStyle get detailsName;
  TextStyle get detailsItensTitle;
  TextStyle get detailsItensSubtitle;
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

  @override
  TextStyle get appBar => GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppTheme.colors.titleAppBar);

  @override
  TextStyle get infoCardTitle => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.infoCardTitle,
      );

  @override
  TextStyle get infoCardSubTitle1 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.infoCardSubTitle1,
      );

  @override
  TextStyle get infoCardSubTitle2 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.infoCardSubTitle2,
      );

  @override
  TextStyle get eventTileMoney => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTileMoney,
      );

  @override
  TextStyle get eventTilePeople => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTilePeople,
      );

  @override
  TextStyle get eventTileSubtitle => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTileSubtitle,
      );

  @override
  TextStyle get eventTileTitle => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.eventTileTitle,
      );

  @override
  TextStyle get stepperIndicatorPrimary => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.stepperIndicatorPrimary,
      );

  @override
  TextStyle get stepperIndicatorSecondary => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.stepperIndicatorSecondary,
      );

  @override
  TextStyle get stepperNextButton => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextButton,
      );

  @override
  TextStyle get stepperDescription => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.stepperDescription,
      );

  @override
  TextStyle get stepperTitle => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.stepperTitle,
      );

  @override
  TextStyle get hintTextField => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.hintTextField,
      );

  @override
  TextStyle get textField => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textField,
      );

  @override
  TextStyle get stepperNextButtonDisabled => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextButtonDisabled,
      );

  @override
  TextStyle get detailsTitle => GoogleFonts.montserrat(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.detailsTitle,
      );

  @override
  TextStyle get detailsNegativeSubtitle => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppTheme.colors.negativeMoneyDetails,
      );

  @override
  TextStyle get detailsNegativeSubtitleBold => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppTheme.colors.negativeMoneyDetails,
      );

  @override
  TextStyle get detailsPositiveSubtitle => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppTheme.colors.positiveMoneyDetails,
      );

  @override
  TextStyle get detailsPositiveSubtitleBold => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppTheme.colors.positiveMoneyDetails,
      );

  @override
  TextStyle get detailsSubtitle => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.detailsSubtitle,
      );

  @override
  TextStyle get detailsName => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.detailsName,
      );

  @override
  TextStyle get detailsItensSubtitle => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.detailsSubtitle,
      );

  @override
  TextStyle get detailsItensTitle => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.detailsSubtitle,
      );
}
