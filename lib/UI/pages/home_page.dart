import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:team_management_app/UI/widgets/custom_app_bar.dart';
import 'package:team_management_app/UI/widgets/player_info_card.dart';
import 'package:team_management_app/models/design_properties.dart';
import 'package:team_management_app/models/player_data.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final image = 'assets/images/Glossy Blue Eagle Crown Emblem.png';

  final _mybox = Hive.box<PlayerData>('players');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(mainPadding),
        child: Column(
          children: [
            Row(
              children: [
                teamLogo(),
                SizedBox(width: objectPadding),
                Text(
                  'اكادمية حي 144',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(width: objectPadding),
                teamLogo(),
              ],
            ),
            SizedBox(height: groupPadding),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ePadding,
                  mainAxisSpacing: ePadding,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => PlayerInfoCard(
                  familyName: 'بوطبيله',
                  name: 'عبد المهيمن',
                  number: '10',
                ),
                // {
                //   final player = _mybox.getAt(index);

                //   return PlayerInfoCard(
                //     familyName: player!.familyName,
                //     name: player.name,
                //     number: player.playerNumber,
                //   );
                // },
              ),
            ),

            SizedBox(height: objectPadding),
          ],
        ),
        // FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
      ),
    );
  }

  Image teamLogo() =>
      Image.asset(image, height: 58, width: 58, fit: BoxFit.cover);
}
