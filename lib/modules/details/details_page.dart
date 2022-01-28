import 'package:flutter/material.dart';
import 'package:split_it/modules/details/widget/itens_widget.dart';
import 'package:split_it/modules/details/widget/members_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.colors.backButton),
        title: Center(
          child: Text(
            'Churrasco',
            style: AppTheme.textStyles.detailsTitle,
          ),
        ),
        backgroundColor: AppTheme.colors.backgroundPrimary,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(children: const [
        MembersWidget(),
        SizedBox(
          height: 8,
        ),
        ItensWidget()
      ]),
    );
  }
}
