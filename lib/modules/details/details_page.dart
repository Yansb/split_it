import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/details/details_controller.dart';
import 'package:split_it/modules/details/details_status.dart';
import 'package:split_it/modules/details/widget/itens_widget.dart';
import 'package:split_it/modules/details/widget/members_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/theme/app_theme.dart';

class DetailsPage extends StatefulWidget {
  final EventModel event;
  const DetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ReactionDisposer _disposer;
  final EventDetailsController controller =
      EventDetailsController(repository: FirebaseRepository());

  late EventModel event;

  @override
  void initState() {
    event = widget.event;
    _disposer = autorun((_) {
      if (controller.status.runtimeType == EventDetailsStatusSuccess) {
        BotToast.closeAllLoading();
        Navigator.pop(context);
      } else if (controller.status.runtimeType == EventDetailsStatusFailure) {
        BotToast.closeAllLoading();
        BotToast.showText(
          text: "Não foi possível deletar esse evento",
          contentColor: Colors.yellow.shade700,
        );
      } else if (controller.status.runtimeType == EventDetailsStatusLoading) {
        BotToast.showLoading();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.colors.backButton),
        centerTitle: true,
        title: Text(
          event.name,
          style: AppTheme.textStyles.detailsTitle,
        ),
        elevation: 0,
        backgroundColor: AppTheme.colors.backgroundPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              controller.delete(event.id);
            },
          ),
        ],
      ),
      body: Column(children: [
        MembersWidget(
            event: event,
            totalValue: event.value,
            friends: event.friends,
            onChanged: (newEvent) {
              event = newEvent;
              setState(() {});
            }),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppTheme.colors.detailsBackground,
          ),
        ),
        ItensWidget(
          items: event.items,
          remainingValue: event.remainingValue,
        )
      ]),
    );
  }
}
