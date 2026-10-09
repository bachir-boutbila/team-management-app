import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:team_management_app/UI/pages/add_new_palyer.dart';

import 'package:team_management_app/UI/pages/navigation_page.dart';
import 'package:team_management_app/UI/widgets/custom_app_bar.dart';
import 'package:team_management_app/models/design_properties.dart';
import 'package:team_management_app/models/player_data.dart';

// text adjustement

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PlayerDataAdapter());
  await Hive.openBox<PlayerData>('players');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'), // English, no country code
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        textTheme: TextTheme(
          // Main titles
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),

          // Section titles / less important titles
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),

          // Normal text
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
      ),

      home: AddNewPalyer(),
    );
  }
}
