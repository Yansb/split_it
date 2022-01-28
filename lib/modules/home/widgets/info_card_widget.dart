import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/icon_dollar_widget.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/shared/widgets/loading_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class InfoCardWidget extends StatefulWidget {
  final double value;
  final bool isLoading;
  const InfoCardWidget({
    Key? key,
    required this.value,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<InfoCardWidget> createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {
  final formatter = NumberFormater();

  TextStyle get textStyle => widget.value >= 0
      ? AppTheme.textStyles.infoCardSubTitle1
      : AppTheme.textStyles.infoCardSubTitle2;

  IconDollarType get iconDollarType =>
      widget.value >= 0 ? IconDollarType.receive : IconDollarType.send;

  String get title => widget.value >= 0 ? "receber" : "pagar";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 168,
      decoration: BoxDecoration(
          color: AppTheme.colors.backgroundPrimary,
          borderRadius: BorderRadius.circular(10),
          border:
              Border.fromBorderSide(BorderSide(color: AppTheme.colors.border))),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconDollarWidget(type: iconDollarType),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "A $title",
                style: AppTheme.textStyles.infoCardTitle,
              ),
              if (widget.isLoading) ...[
                const LoadingWidget(size: Size(94, 24))
              ] else ...[
                Text(
                  "R\$ ${formatter.currencyFormatter(widget.value)}",
                  style: textStyle,
                )
              ]
            ],
          )
        ],
      ),
    );
  }
}
