import 'package:flutter/material.dart';
import 'package:team_management_app/models/design_properties.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final image = 'assets/images/Glossy Blue Eagle Crown Emblem.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
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
                itemBuilder: (context, index) => Container(
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
                      Text(
                        'بوطبيله',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: objectPadding),
                      Text(
                        'عبد المهيمن',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: objectPadding),
                      Text(
                        '10',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: objectPadding),
            // FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }

  Image teamLogo() =>
      Image.asset(image, height: 58, width: 58, fit: BoxFit.cover);
}
