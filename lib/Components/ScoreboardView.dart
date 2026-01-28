import 'package:flutter/material.dart';

class ScoreboardView extends StatefulWidget {
  // 1. Mark fields as final for immutability
  final String currPlayer;
  final String oppPlayer;

  const ScoreboardView({
    super.key,
    required this.currPlayer,
    required this.oppPlayer,
  });

  @override
  State<ScoreboardView> createState() => _ScoreboardViewState();
}

// 2. Private state classes are prefixed with an underscore
class _ScoreboardViewState extends State<ScoreboardView> {
  // 3. Variables should be lowerCamelCase
  final List<String> gameScores = const ["0", "15", "30", "40", "Ad"];

  @override
  Widget build(BuildContext context) {
    // 4. Use Theme.of(context) for consistent styling
    final textStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2390E9), Colors.black],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Background handled by Container
        appBar: AppBar(
          title: const Text('Game Score'),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // 5. Use const for performance
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _PlayerScoreColumn(
                      name: widget.currPlayer,
                      score: gameScores[0],
                      icon: Icons.sports_baseball,
                      iconColor: Colors.green,
                    ),
                    Text("-", style: textStyle?.copyWith(fontSize: 36)),
                    _PlayerScoreColumn(
                      name: widget.oppPlayer,
                      score: gameScores[2],
                      icon: Icons.sports_tennis,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("", style: TextStyle(fontSize: 20, color: Colors.white,)),
                          Text(widget.currPlayer, style: TextStyle(fontSize: 20, color: Colors.white)),
                          Text(widget.oppPlayer, style: TextStyle(fontSize: 20, color: Colors.white)),
                        ]
                      ),
                      const SizedBox(width: 20),
                      
                      _SetScoreColumn(
                        setNumber: "Set 1",
                        playerScore: 6,
                        opponentScore: 4,
                      ),
                      _SetScoreColumn(
                        setNumber: "Set 2",
                        playerScore: 3,
                        opponentScore: 6,
                      ),
                      _SetScoreColumn(
                        setNumber: "Set 3",
                        playerScore: 5,
                        opponentScore: 7,
                      ),
                    ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 6. Extracted reusable components keep build methods lean
class _PlayerScoreColumn extends StatelessWidget {
  final String name;
  final String score;
  final IconData icon;
  final Color? iconColor;

  const _PlayerScoreColumn({
    required this.name,
    required this.score,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(name, style: const TextStyle(fontSize: 24, color: Colors.white)),
        Text(
          score,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Icon(icon, color: iconColor ?? Colors.white),
      ],
    );
  }
}

class _SetScoreColumn extends StatelessWidget {
  final String setNumber;
  final int playerScore;
  final int opponentScore;

  const _SetScoreColumn({
    required this.setNumber,
    required this.playerScore,
    required this.opponentScore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          setNumber,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          '$playerScore',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$opponentScore',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
