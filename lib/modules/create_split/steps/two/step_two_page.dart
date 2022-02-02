import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_controller.dart';
import 'package:split_it/modules/create_split/widgets/person_tile.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  final CreateSplitController controller;
  const StepTwoPage({Key? key, required this.controller}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  late StepTwoController controller;

  @override
  void initState() {
    controller = StepTwoController(controller: widget.controller);
    controller.getFriends();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StepTitleWidget(
            title: "Com quem",
            subtitle: "você quer dividir?",
          ),
          StepInputTextWidget(
              onChange: (value) {
                controller.onChange(value);
              },
              hintText: "Nome da pessoa"),
          Observer(builder: (_) {
            if (controller.selectedFriends.isEmpty) {
              return Container();
            } else {
              return Column(
                children: [
                  ...controller.selectedFriends
                      .map((e) => PersonTileWidget(
                            data: e,
                            onTap: () => {controller.removeFriend(e)},
                            isSelected: true,
                          ))
                      .toList(),
                  const SizedBox(height: 16)
                ],
              );
            }
          }),
          const SizedBox(height: 35),
          Observer(builder: (_) {
            if (controller.items.isEmpty) {
              return const Text("Nenhum amigo encontrado");
            } else {
              return Column(
                children: controller.items
                    .map((e) => PersonTileWidget(
                          data: e,
                          onTap: () {
                            controller.addFriend(e);
                          },
                        ))
                    .toList(),
              );
            }
          }),
        ],
      ),
    );
  }
}
