// MatchFormat class
class MatchFormat {
  final ScoringType scoringType;
  final SetFormat setFormat;
  final FinalSetFormat finalSetFormat;

  const MatchFormat({
    required this.scoringType,
    required this.setFormat,
    required this.finalSetFormat,
  });

  // Replicates Swift's computed properties using getters
  int get setsToWin {
    return switch (setFormat) {
      SetFormat.bestOf3 => 2,
      SetFormat.bestOf5 => 3,
      _ => 1,
    };
  }

  int get gamesPerSetToWin {
    return switch (setFormat) {
      SetFormat.fast4 => 4,
      SetFormat.proSet => 8,
      _ => 6,
    };
  }

  int get playTieBreakAt {
    return switch (setFormat) {
      SetFormat.fast4 => 3,
      SetFormat.proSet => 7,
      _ => 6,
    };
  }

  // Default format static constant
  static const defaultFormat = MatchFormat(
    scoringType: ScoringType.ad,
    setFormat: SetFormat.bestOf3,
    finalSetFormat: FinalSetFormat.regularSet,
  );
}

// Enums with explicit string values for serialization
enum SetFormat {
  fast4,
  stdSet,
  proSet,
  bestOf3,
  bestOf5;
}

enum TieBreakFormat {
  standardTiebreaker,
  superTiebreaker;
}

enum ScoringType {
  ad,
  noAd;
}

enum FinalSetFormat {
  regularSet,
  matchTiebreak;
}

enum Player {
  curr,
  opp,
}