import 'package:flutter/material.dart';

import 'package:split_it/modules/home/widgets/icon_dollar_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/shared/widgets/loading_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTileWidget extends StatefulWidget {
  final EventModel model;
  final bool isLoading;
  final VoidCallback onTap;

  const EventTileWidget({
    Key? key,
    required this.model,
    this.isLoading = false,
    required this.onTap,
  }) : super(key: key);

  @override
  State<EventTileWidget> createState() => _EventTileWidgetState();
}

class _EventTileWidgetState extends State<EventTileWidget> {
  final formatClass = NumberFormater();

  IconDollarType get type =>
      widget.model.value >= 0 ? IconDollarType.receive : IconDollarType.send;

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Row(
        children: [
          const LoadingWidget(size: Size(48, 48)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const LoadingWidget(size: Size(81, 19)),
                    subtitle: const LoadingWidget(size: Size(81, 18)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        LoadingWidget(size: Size(61, 17)),
                        LoadingWidget(size: Size(61, 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    return Row(
      children: [
        IconDollarWidget(type: type),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: widget.onTap,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    widget.model.name,
                    style: AppTheme.textStyles.eventTileTitle,
                  ),
                  subtitle: Text(
                    formatClass.dateFormatter(widget.model.created!),
                    style: AppTheme.textStyles.eventTileSubtitle,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "R\$ ${formatClass.currencyFormatter(widget.model.value)}",
                        style: AppTheme.textStyles.eventTileMoney,
                      ),
                      Text(
                        "${widget.model.people} ${widget.model.people > 1 ? 'pessoas' : 'pessoa'}",
                        style: AppTheme.textStyles.eventTilePeople,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: AppTheme.colors.divider,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
