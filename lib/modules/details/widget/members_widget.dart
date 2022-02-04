import 'package:flutter/material.dart';
import 'package:split_it/modules/details/widget/member_tile_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/theme/app_theme.dart';

class MembersWidget extends StatefulWidget {
  final List<FriendModel> friends;
  final double totalValue;
  final EventModel event;
  final Function(EventModel newEvent) onChanged;

  const MembersWidget(
      {Key? key,
      required this.friends,
      required this.totalValue,
      required this.event,
      required this.onChanged})
      : super(key: key);

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
                        "INTEGRANTES",
                        style: AppTheme.textStyles.detailsSubtitle,
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: SingleChildScrollView(
                        child: Column(
                          children: widget.friends
                              .map(
                                (e) => MemberTileWidget(
                                    key: UniqueKey(),
                                    event: widget.event,
                                    friend: e,
                                    value: widget.totalValue /
                                        widget.friends.length,
                                    onChanged: widget.onChanged),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
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
