import 'package:flutter/material.dart';

class PersonTileWidget extends StatelessWidget {
  final String name;
  final String? photo_url;
  final bool isSelected;
  const PersonTileWidget(
      {Key? key, required this.name, this.photo_url, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        color: Colors.grey.shade200,
      ),
      title: Text(name),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(isSelected ? Icons.remove : Icons.add),
      ),
    );
  }
}
