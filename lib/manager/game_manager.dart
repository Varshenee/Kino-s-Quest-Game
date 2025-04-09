import 'package:flutter/material.dart';

class GameManager extends ChangeNotifier {
  int eggsCollected = 0;
  int livesLeft = 3;

  void collectEgg(int index) {
    eggsCollected++;
    notifyListeners();
  }

  void loseLife() {
    if (livesLeft > 0) {
      livesLeft--;
      notifyListeners();
    }
  }

  void resetGame() {
    eggsCollected = 0;
    livesLeft = 3;
    notifyListeners();
  }
}
