import 'package:flutter/material.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/shared/widgets/checkbox_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class MemberTileWidget extends StatefulWidget {
  final UserModel user;
  final double value;
  const MemberTileWidget({Key? key, required this.user, required this.value})
      : super(key: key);

  @override
  State<MemberTileWidget> createState() => _MemberTileWidgetState();
}

class _MemberTileWidgetState extends State<MemberTileWidget> {
  final formatClass = NumberFormater();
  var checked = false;

  TextStyle get moneyDetailsBold => checked
      ? AppTheme.textStyles.detailsPositiveSubtitleBold
      : AppTheme.textStyles.detailsNegativeSubtitleBold;

  TextStyle get moneyDetails => checked
      ? AppTheme.textStyles.detailsPositiveSubtitle
      : AppTheme.textStyles.detailsNegativeSubtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          child: Image.network(
            widget.user.photoUrl!,
            width: 56,
            height: 56,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          widget.user.name!,
          style: AppTheme.textStyles.detailsName,
        ),
        subtitle: Text.rich(
          TextSpan(text: "R\$ ", style: moneyDetails, children: [
            TextSpan(
              text: formatClass.currencyFormatter(widget.value),
              style: moneyDetailsBold,
            )
          ]),
        ),
        trailing: CheckboxWidget(
          checked: checked,
          onChanged: (value) {
            checked = value ?? false;
            setState(() {});
          },
        ));
  }
}
