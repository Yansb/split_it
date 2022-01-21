import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/add_button_widget.dart';
import 'package:split_it/modules/home/widgets/info_card_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onTapAddButton;
  AppBarWidget({required this.user, Key? key, required this.onTapAddButton})
      : super(
            key: key,
            child: Stack(
              children: [
                Container(
                  color: AppTheme.colors.backgroundSplash,
                  height: 230,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 62),
                      child: ListTile(
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
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        InfoCardWidget(
                          value: 150,
                        ),
                        InfoCardWidget(
                          value: -140,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            preferredSize: const Size.fromHeight(262));
}
