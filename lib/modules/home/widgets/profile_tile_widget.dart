import 'package:flutter/material.dart';

import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

import 'add_button_widget.dart';

class ProfileTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTapAddButton;

  const ProfileTile({
    Key? key,
    required this.user,
    required this.onTapAddButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        child: Image.network(
          user.photoUrl!,
          width: 56,
          height: 56,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        user.name!,
        style: AppTheme.textStyles.appBar,
      ),
      trailing: AddButtonWidget(
        onTap: onTapAddButton,
      ),
    );
  }
}
