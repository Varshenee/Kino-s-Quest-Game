import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: const Text('Game Rules 🍄', style: TextStyle( color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to start page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Baby Kino has lost it\'s mom. He is wandering alone in the dangerous gardens of maple.',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            Text(
              'Help Baby Kino reach its mom!✨',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            const SizedBox(height: 20),
            ruleBullet('Avoid obstacles in each level.'),
            ruleBullet('Use on-screen buttons to move Baby Kino.'),
            ruleBullet('Collect all the eggs you see.'),
            ruleBullet('Clear 3 levels to win the game!'),
            const Spacer(),
            Center(
              child: Text(
                'Good luck 🍀',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.green[700],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Custom bullet point widget
  Widget ruleBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Text('🍄 ', style: TextStyle(fontSize: 20)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
