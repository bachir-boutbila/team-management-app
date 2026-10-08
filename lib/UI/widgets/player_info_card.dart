import 'package:flutter/material.dart';
import 'package:team_management_app/models/design_properties.dart';

class PlayerInfoCard extends StatelessWidget {
  final String familyName;
  final String name;
  final String number;
  const PlayerInfoCard({
    required this.familyName,
    required this.name,
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      padding: EdgeInsets.all(ePadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(familyName, style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: objectPadding),
          Text(name, style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: objectPadding),
          Text(number, style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}
