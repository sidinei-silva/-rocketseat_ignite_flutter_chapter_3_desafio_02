import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTileWidget extends StatelessWidget {
  final String name;
  final bool isRemoved;

  const PersonTileWidget({
    Key? key,
    required this.name,
    this.isRemoved = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          )),
      title: Text(
        name,
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
        onPressed: () {},
      ),
    );
  }
}
