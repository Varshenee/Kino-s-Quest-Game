import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../manager/game_manager.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameManager>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.black.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("🥚 Eggs: ${game.eggsCollected}", style: const TextStyle(color: Colors.white, fontSize: 18)),
          Text("❤️ Lives: ${game.livesLeft}", style: const TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}
