import 'package:flutter/material.dart';

import 'package:split_it/theme/app_theme.dart';

class CheckboxWidget extends StatefulWidget {
  final bool checked;
  final void Function(bool?)? onChanged;
  const CheckboxWidget({
    Key? key,
    required this.checked,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  Color get backgroundColor => widget.checked == true
      ? AppTheme.colors.checkboxBackground
      : AppTheme.colors.checkboxBackgroundSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
      child: Theme(
        data: ThemeData(
          unselectedWidgetColor: AppTheme.colors.uncheckedCheckbox,
        ),
        child: Checkbox(
          value: widget.checked,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
              side: BorderSide(color: Colors.white)),
          activeColor: AppTheme.colors.backgroundSplash,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
