import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/top_bar.dart';
import '../manager/game_manager.dart';

class Level1Page extends StatefulWidget {
  const Level1Page({super.key});

  @override
  State<Level1Page> createState() => _Level1PageState();
}

class _Level1PageState extends State<Level1Page> {
  double kinoX = 100;
  double kinoY = 300;

  List<Offset> eggPositions = [Offset(200, 150), Offset(320, 400)];
  List<Offset> obstaclePositions = [Offset(150, 250), Offset(300, 500)];

  void checkCollisions() {
    // Egg collision
    for (int i = 0; i < eggPositions.length; i++) {
      if ((kinoX - eggPositions[i].dx).abs() < 40 &&
          (kinoY - eggPositions[i].dy).abs() < 40) {
        Provider.of<GameManager>(context, listen: false).collectEgg(i);
        setState(() {
          eggPositions.removeAt(i);
        });
        break;
      }
    }

    // Obstacle collision
    for (Offset obs in obstaclePositions) {
      if ((kinoX - obs.dx).abs() < 40 && (kinoY - obs.dy).abs() < 40) {
        Provider.of<GameManager>(context, listen: false).loseLife();
        break;
      }
    }
  }

  void moveKino(double dx, double dy) {
    setState(() {
      kinoX += dx;
      kinoY += dy;
      checkCollisions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/level1_bg.png', fit: BoxFit.cover),
          ),
          const SafeArea(child: TopBar()),

          // Eggs
          ...eggPositions.map((pos) => Positioned(
            left: pos.dx,
            top: pos.dy,
            child: Image.asset('assets/images/egg.png', width: 32),
          )),

          // Obstacles
          ...obstaclePositions.map((pos) => Positioned(
            left: pos.dx,
            top: pos.dy,
            child: Image.asset('assets/images/rock.png', width: 40),
          )),

          // Kino
          Positioned(
            left: kinoX,
            top: kinoY,
            child: Image.asset('assets/images/kino/walk_1.png', width: 48),
          ),

          // Movement Buttons
          Positioned(
            bottom: 40,
            left: 30,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => moveKino(-20, 0),
                  icon: const Icon(Icons.arrow_left),
                ),
                IconButton(
                  onPressed: () => moveKino(20, 0),
                  icon: const Icon(Icons.arrow_right),
                ),
                IconButton(
                  onPressed: () => moveKino(0, -20),
                  icon: const Icon(Icons.arrow_upward),
                ),
                IconButton(
                  onPressed: () => moveKino(0, 20),
                  icon: const Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
