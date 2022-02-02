import 'package:flutter/material.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTileWidget extends StatelessWidget {
  final FriendModel data;
  final bool isSelected;
  final VoidCallback? onTap;
  const PersonTileWidget(
      {Key? key,
      required this.data,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(data.photoUrl), fit: BoxFit.cover)),
      ),
      title: Text(data.name,
          style: isSelected
              ? AppTheme.textStyles.personTileTitleSelected
              : AppTheme.textStyles.personTileTitle),
      trailing: IconButton(
        onPressed: onTap,
        icon: isSelected
            ? Icon(Icons.remove, color: AppTheme.colors.iconRemove)
            : Icon(
                Icons.add,
                color: AppTheme.colors.iconAdd,
              ),
      ),
    );
  }
}
