import 'package:flutter/material.dart';
import '../widgets/kino_walking.dart'; // We'll create this

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/images/start_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.1),
            ),
          ),

          // Foreground content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Baby Kino\'s Quest🌱',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.green.shade400,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),

                KinoWalking(size: 100),

                SizedBox(height: 5),

                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/level1'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Start Game'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/rules'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[300],
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Rules'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
