import 'package:flutter/material.dart';
import 'package:split_it/modules/details/widget/member_tile_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class MembersWidget extends StatefulWidget {
  const MembersWidget({Key? key}) : super(key: key);

  @override
  State<MembersWidget> createState() => _MembersWidgetState();
}

class _MembersWidgetState extends State<MembersWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        decoration: BoxDecoration(color: AppTheme.colors.detailsBackground),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration:
                  BoxDecoration(color: AppTheme.colors.backgroundPrimary),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Integrantes",
                        style: AppTheme.textStyles.detailsSubtitle,
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            MemberTileWidget(
                              value: 200,
                              user: UserModel(
                                email: "email@email.com",
                                id: "qewjeoiq",
                                name: "Você",
                                photoUrl:
                                    "https://randomuser.me/api/portraits/men/26.jpg",
                              ),
                            ),
                            MemberTileWidget(
                              value: 200,
                              user: UserModel(
                                email: "email@email.com",
                                id: "qewjeoiq",
                                name: "Fulana",
                                photoUrl:
                                    "https://randomuser.me/api/portraits/women/60.jpg",
                              ),
                            ),
                            MemberTileWidget(
                              value: 200,
                              user: UserModel(
                                email: "email@email.com",
                                id: "qewjeoiq",
                                name: "Fulana",
                                photoUrl:
                                    "https://randomuser.me/api/portraits/women/60.jpg",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
