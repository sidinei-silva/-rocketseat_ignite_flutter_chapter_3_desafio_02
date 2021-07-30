import 'package:flutter/material.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTileWidget extends StatelessWidget {
  final FriendModel data;
  final bool isRemoved;
  final VoidCallback onPressed;

  const PersonTileWidget({
    Key? key,
    this.isRemoved = false,
    required this.onPressed,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data.photoUrl),
              fit: BoxFit.cover,
            ),
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          )),
      title: Text(
        data.name,
        style: isRemoved
            ? AppTheme.textStyles.personTileNameAdded
            : AppTheme.textStyles.personTileName,
      ),
      trailing: IconButton(
        icon: isRemoved
            ? Icon(
                Icons.remove,
                color: AppTheme.colors.personTileIconRemove,
              )
            : Icon(
                Icons.add,
                color: AppTheme.colors.personTileIconAdd,
              ),
        onPressed: onPressed,
      ),
    );
  }
}
