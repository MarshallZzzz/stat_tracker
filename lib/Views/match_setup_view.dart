import 'package:flutter/material.dart';
import 'package:stat_tracker/Models/match_format.dart';

class MatchSetupView extends StatefulWidget {
  const MatchSetupView({super.key});

  @override
  State<MatchSetupView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchSetupView> {
  // State variables
  final TextEditingController _playerController = TextEditingController();
  final TextEditingController _opponentController = TextEditingController();
  
  SetFormat _setFormat = SetFormat.fast4;
  bool _areAdsEnabled = true;
  bool _isFinalSet = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0D0D1A), Color(0xFF1A1426)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: const [
                    Text(
                      "Creating New Match",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Set up your match details",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Player"),
                      _buildTextField(_playerController, "Enter player name"),
                      const SizedBox(height: 24),
                      
                      _buildLabel("Opponent"),
                      _buildTextField(_opponentController, "Enter opponent name"),
                      const SizedBox(height: 24),

                      _buildLabel("Ads & Final Set Settings"),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: SwitchListTile(
                              title: Text(_areAdsEnabled ? "Ads" : "No Ads", style: const TextStyle(color: Colors.white, fontSize: 14)),
                              value: _areAdsEnabled,
                              activeColor: Colors.purpleAccent,
                              onChanged: (val) => setState(() => _areAdsEnabled = val),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          Expanded(
                            child: SwitchListTile(
                              title: Text(_isFinalSet ? "Regular" : "Tiebreak", style: const TextStyle(color: Colors.white, fontSize: 14)),
                              value: _isFinalSet,
                              activeColor: Colors.greenAccent,
                              onChanged: (val) => setState(() => _isFinalSet = val),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      _buildLabel("Match Scoring"),
                      const SizedBox(height: 12),
                      _buildFormatButton("Fast 4", SetFormat.fast4),
                      _buildFormatButton("6 Game Set", SetFormat.stdSet),
                      _buildFormatButton("8 Game Pro Set", SetFormat.proSet),
                      _buildFormatButton("Best Out of 3", SetFormat.bestOf3),
                      _buildFormatButton("Best Out of 5", SetFormat.bestOf5),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build labels
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  // Helper to build stylized text fields
  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.cyan,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF262633),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  // Helper for the Match Format selection buttons
  Widget _buildFormatButton(String title, SetFormat format) {
    bool isSelected = _setFormat == format;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => setState(() => _setFormat = format),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.cyan.withOpacity(0.2) : const Color(0xFF262633),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isSelected ? Colors.cyan : Colors.transparent, width: 2),
          ),
          child: Center(
            child: Text(title, style: TextStyle(color: isSelected ? Colors.cyan : Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
