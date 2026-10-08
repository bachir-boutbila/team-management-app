import 'package:flutter/material.dart';
import 'package:team_management_app/UI/pages/home_page.dart';
import 'package:team_management_app/models/design_properties.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final List pages = [HomePage(), Center(child: Text('صفحة الاعدادات'))];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 80,
        backgroundColor: barsColor,
        indicatorColor: Colors.transparent,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home, color: iconColor, size: 40),
            label: 'الصفحة الرئيسية',
            selectedIcon: Icon(Icons.home, color: Colors.blueAccent, size: 40),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings, color: iconColor, size: 40),
            label: 'الاعدادات',
            selectedIcon: Icon(
              Icons.settings,
              color: Colors.blueAccent,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

// adjust the tex
// make a class
// make a gid view card
