import 'package:flutter/material.dart';
import 'package:split_it/modules/details/models/item_model.dart';
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
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Text(
            widget.item.title,
            style: AppTheme.textStyles.detailsItensTitle,
          ),
          trailing: Text(numberFormater.currencyFormatter(widget.item.value),
              style: AppTheme.textStyles.detailsItensTitle),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
