import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/details/widget/itens_tile_widget.dart';
import 'package:split_it/shared/models/item_model.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/theme/app_theme.dart';

class ItensWidget extends StatefulWidget {
  final List<ItemModel> items;
  final double remainingValue;

  const ItensWidget(
      {Key? key, required this.items, required this.remainingValue})
      : super(key: key);

  @override
  State<ItensWidget> createState() => _ItensWidgetState();
}

class _ItensWidgetState extends State<ItensWidget> {
  final numberFormatter = NumberFormater();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppTheme.colors.backgroundPrimary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("ÍTENS", style: AppTheme.textStyles.detailsItensTitle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...widget.items.map((e) => ItensTileWidget(
                        item: e,
                      ))
                ],
              ),
            ),
          ),
          Container(
            height: 44,
            decoration: BoxDecoration(color: AppTheme.colors.detailsBackground),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: AppTheme.textStyles.detailsItensTitle,
                    ),
                    Text(
                      numberFormatter.currencyFormatter(
                          widget.items.fold(0, (a, b) => a + b.value)),
                      style: AppTheme.textStyles.detailsItensTitle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Observer(builder: (context) {
                      return Text(
                        "Faltam ${numberFormatter.currencyFormatter(widget.remainingValue)}",
                        style: AppTheme.textStyles.detailsNegativeSubtitleBold,
                      );
                    })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
