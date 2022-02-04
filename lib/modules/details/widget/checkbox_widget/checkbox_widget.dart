import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/details/widget/checkbox_widget/checkbox_controller.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

import 'package:split_it/theme/app_theme.dart';

class CheckboxWidget extends StatefulWidget {
  final EventModel event;
  final Function(EventModel newEvent) onChanged;
  final FriendModel friend;
  const CheckboxWidget(
      {Key? key,
      required this.event,
      required this.friend,
      required this.onChanged})
      : super(key: key);

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  late CheckboxController controller;

  Color get backgroundColor => controller.status == ClassCheckboxStatus.checked
      ? AppTheme.colors.checkboxBackground
      : AppTheme.colors.checkboxBackgroundSelected;

  @override
  void initState() {
    controller = CheckboxController(
        event: widget.event, repository: FirebaseRepository());
    if (widget.friend.isPaid) {
      controller.status = ClassCheckboxStatus.checked;
    }
    autorun((_) {
      if (controller.status == ClassCheckboxStatus.checked ||
          controller.status == ClassCheckboxStatus.unchecked) {
        widget.onChanged(controller.event);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(5)),
        child: Theme(
          data: ThemeData(
            unselectedWidgetColor: AppTheme.colors.uncheckedCheckbox,
          ),
          child: Checkbox(
            value: controller.status == ClassCheckboxStatus.checked,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: const BorderSide(color: Colors.white)),
            activeColor: AppTheme.colors.backgroundSplash,
            onChanged: (_) {
              controller.update(widget.friend);
            },
          ),
        ),
      ),
    );
  }
}
