import 'package:flutter/material.dart';
import 'package:split_it/shared/models/item_model.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/theme/app_theme.dart';

class ItensTileWidget extends StatefulWidget {
  final ItemModel item;
  const ItensTileWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<ItensTileWidget> createState() => _ItensTileWidgetState();
}

class _ItensTileWidgetState extends State<ItensTileWidget> {
  final NumberFormater numberFormater = NumberFormater();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.item.name,
                style: AppTheme.textStyles.detailsItensTitle,
              ),
              Text(numberFormater.currencyFormatter(widget.item.value),
                  style: AppTheme.textStyles.detailsItensTitle),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            indent: 0,
            height: 1,
          ),
        ],
      ),
    );
  }
}
