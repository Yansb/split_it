import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/bottom_app_bar/bottom_app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/profile_tile_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTapAddButton;
  const AppBarWidget(
      {Key? key, required this.user, required this.onTapAddButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 230,
          color: AppTheme.colors.backgroundSplash,
        ),
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 62),
                child: ProfileTile(
                  user: user,
                  onTapAddButton: onTapAddButton,
                )),
            const SizedBox(
              height: 36,
            ),
            const BottomAppBarWidget()
          ],
        ),
      ],
    );
  }
}
