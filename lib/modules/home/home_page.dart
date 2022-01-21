import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/event_tile_widget.dart';
import 'package:split_it/modules/home/widgets/info_card_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final events = [
    EventModel(
      created: DateTime.now(),
      title: "Churrasco",
      people: 2,
      value: 100,
    ),
    EventModel(
      created: DateTime.now(),
      title: "Churrasco",
      people: 2,
      value: 100,
    ),
    EventModel(
      created: DateTime.now(),
      title: "Churrasco",
      people: 2,
      value: 100,
    ),
    EventModel(
      created: DateTime.now(),
      title: "Churrasco",
      people: 2,
      value: 50,
    ),
    EventModel(
      created: DateTime.now(),
      title: "Churrasco",
      people: 2,
      value: -100,
    ),
    EventModel(
      created: DateTime.now(),
      title: "Churrasco",
      people: 2,
      value: -100,
    )
  ];
  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        onTapAddButton: () {},
        user: user,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: events.map((e) => EventTileWidget(model: e)).toList(),
          ),
        ),
      ),
    );
  }
}
