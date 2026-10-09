import 'package:flutter/material.dart';
import 'package:team_management_app/models/design_properties.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: barsColor,
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: ePadding),
        child: Center(
          child: Text(
            'اسم مستخدم',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(left: ePadding),
          child: CircleAvatar(
            backgroundColor: iconColor,
            child: Icon(Icons.sports_football),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
