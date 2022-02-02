import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

import 'package:split_it/modules/create_split/widgets/step_input_text.dart';

class StepMultiInputText extends StatefulWidget {
  final int count;
  final String? initialName;
  final double? initialValue;
  final ValueChanged<String> itemName;
  final ValueChanged<double> itemValue;
  final VoidCallback? onDelete;

  StepMultiInputText({
    Key? key,
    required this.count,
    required this.itemName,
    required this.itemValue,
    this.initialName,
    this.initialValue,
    this.onDelete,
  }) : super(key: key);

  @override
  State<StepMultiInputText> createState() => _StepMultiInputTextState();
}

class _StepMultiInputTextState extends State<StepMultiInputText> {
  late MoneyMaskedTextController valueInputTextController =
      MoneyMaskedTextController(
    initialValue: widget.initialValue,
    leftSymbol: "R\$",
    decimalSeparator: ',',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(widget.count.toString()),
          ),
          Expanded(
            flex: 3,
            child: StepInputTextWidget(
              initialValue: widget.initialName,
              padding: EdgeInsets.zero,
              onChange: (value) {
                widget.itemName(value);
              },
              hintText: "Ex: Picanha",
              align: TextAlign.start,
            ),
          ),
          Expanded(
            child: StepInputTextWidget(
              textInputType: TextInputType.number,
              controller: valueInputTextController,
              padding: EdgeInsets.zero,
              onChange: (_) {
                widget.itemValue(valueInputTextController.numberValue);
              },
              hintText: "R\$ 0,00",
              align: TextAlign.start,
            ),
          ),
          if (widget.onDelete != null)
            IconButton(
                onPressed: widget.onDelete, icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
