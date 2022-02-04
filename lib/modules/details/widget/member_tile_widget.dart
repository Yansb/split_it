import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/theme/app_theme.dart';

import 'checkbox_widget/checkbox_widget.dart';

class MemberTileWidget extends StatefulWidget {
  final FriendModel friend;
  final Function(EventModel newEvent) onChanged;
  final double value;
  final EventModel event;
  const MemberTileWidget({
    Key? key,
    required this.onChanged,
    required this.friend,
    required this.value,
    required this.event,
  }) : super(key: key);

  @override
  State<MemberTileWidget> createState() => _MemberTileWidgetState();
}

class _MemberTileWidgetState extends State<MemberTileWidget> {
  final formatClass = NumberFormater();

  TextStyle get moneyDetailsBold => widget.friend.isPaid
      ? AppTheme.textStyles.detailsPositiveSubtitleBold
      : AppTheme.textStyles.detailsNegativeSubtitleBold;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(widget.friend.photoUrl),
                  fit: BoxFit.cover)),
        ),
        title: Text(
          widget.friend.name,
          style: AppTheme.textStyles.detailsName,
        ),
        subtitle: Observer(
          builder: (_) => Text(
            formatClass.currencyFormatter(widget.value),
            style: moneyDetailsBold,
          ),
        ),
        trailing: CheckboxWidget(
          event: widget.event,
          friend: widget.friend,
          onChanged: widget.onChanged,
        ));
  }
}
