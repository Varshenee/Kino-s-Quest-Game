import 'package:flutter/material.dart';
import 'pages/start_page.dart';
import 'pages/rules_page.dart';
import 'pages/level1.dart';
import 'manager/game_manager.dart';

void main() {
  runApp(BabyKinoGame());
}

class BabyKinoGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Kino\'s Quest',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/rules': (context) => RulesPage(),
        '/level1': (context) => Level1Page(),
        // Add level2 and level3 later
      },
    );
  }
}
