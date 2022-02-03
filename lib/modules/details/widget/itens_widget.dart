import 'package:flutter/material.dart';
import 'package:split_it/modules/details/models/item_model.dart';
import 'package:split_it/modules/details/widget/itens_tile_widget.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/theme/app_theme.dart';

class ItensWidget extends StatefulWidget {
  const ItensWidget({Key? key}) : super(key: key);

  @override
  State<ItensWidget> createState() => _ItensWidgetState();
}

class _ItensWidgetState extends State<ItensWidget> {
  var mockedList = <ItemModel>[
    ItemModel(title: "Picanha", value: 122),
    ItemModel(title: "Linguicinhad", value: 17),
    ItemModel(title: "Carvão", value: 19),
    ItemModel(title: "Ceverja", value: 68),
    ItemModel(title: "Refrigerante", value: 12),
    ItemModel(title: "Pão de alho", value: 15),
  ];
  final numberFormatter = NumberFormater();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppTheme.colors.backgroundPrimary),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child:
                  Text("Ítens", style: AppTheme.textStyles.detailsItensTitle),
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...mockedList.map((e) => ItensTileWidget(
                          item: e,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: 44,
              decoration:
                  BoxDecoration(color: AppTheme.colors.detailsBackground),
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Text(
                    "Total",
                    style: AppTheme.textStyles.detailsItensTitle,
                  ),
                  trailing: Text(
                    numberFormatter.currencyFormatter(
                        mockedList.fold(0, (a, b) => a + b.value)),
                    style: AppTheme.textStyles.detailsItensTitle,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: Text.rich(TextSpan(
                text: "Faltam R\$ ",
                style: AppTheme.textStyles.detailsNegativeSubtitle,
                children: [
                  TextSpan(
                      text: "126,00",
                      style: AppTheme.textStyles.detailsNegativeSubtitleBold)
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
