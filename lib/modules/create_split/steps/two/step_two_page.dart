import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/person_tile.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  const StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StepTitleWidget(
          title: "Com quem",
          subtitle: "você quer dividir?",
        ),
        StepInputTextWidget(onChange: (value) {}, hintText: "Nome da pessoa"),
        const SizedBox(height: 35),
        const PersonTileWidget(
          name: "Fulano de tal",
          isSelected: true,
        ),
        const PersonTileWidget(
          name: "Fulano de tal",
          isSelected: true,
        ),
        const PersonTileWidget(
          name: "Fulano de tal",
          isSelected: true,
        ),
      ],
    );
  }
}
