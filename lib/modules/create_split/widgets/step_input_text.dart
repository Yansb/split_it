import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputTextWidget extends StatelessWidget {
  final void Function(String)? onChange;
  final String hintText;
  final TextAlign align;
  final String? initialValue;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  const StepInputTextWidget(
      {Key? key,
      required this.onChange,
      required this.hintText,
      this.align = TextAlign.center,
      this.padding,
      this.controller,
      this.textInputType = TextInputType.text,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 64),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: textInputType,
        controller: controller,
        onChanged: onChange,
        textAlign: align,
        style: AppTheme.textStyles.textField,
        cursorColor: AppTheme.colors.backgroundSplash,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTheme.textStyles.hintTextField,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.colors.inputBorder),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.colors.inputBorder),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.colors.inputBorder),
          ),
        ),
      ),
    );
  }
}
