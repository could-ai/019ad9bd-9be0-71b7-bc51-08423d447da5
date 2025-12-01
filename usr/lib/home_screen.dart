import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. UI Elements
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Top Bar: Coins and Gems
                  _buildTopBar(),
                  const Spacer(),

                  // Title
                  _buildTitle(),

                  // Character Placeholder
                  _buildCharacter(),

                  const Spacer(),
                  const Spacer(),

                  // Bottom Buttons
                  _buildBottomButtons(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildCurrencyDisplay(Icons.monetization_on, "1500"),
        const SizedBox(width: 10),
        _buildCurrencyDisplay(Icons.diamond, "25"),
      ],
    );
  }

  Widget _buildCurrencyDisplay(IconData icon, String amount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF5C3D2E).withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD4A373), width: 2),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.yellow[600], size: 24),
          const SizedBox(width: 8),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'JUMP TARZAN',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.yellow[600],
            shadows: const [
              Shadow(
                blurRadius: 2.0,
                color: Color(0xFF5C3D2E),
                offset: Offset(3.0, 3.0),
              ),
              Shadow(
                blurRadius: 2.0,
                color: Colors.black,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
        ),
        const Text(
          'Ultimate Jungle Adventure',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCharacter() {
    // Placeholder for the Tarzan character image
    return Container(
      height: 150,
      width: 150,
      // In a real app, you would use an Image.asset here
      // child: Image.asset('assets/images/tarzan_swing.png'),
      child: Icon(Icons.person, size: 100, color: Colors.white.withOpacity(0.5)),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIconButton(Icons.leaderboard),
        _buildIconButton(Icons.shopping_cart),
        _buildIconButton(Icons.settings),
        _buildPlayButton(context),
        _buildIconButton(Icons.person),
        _buildIconButton(Icons.block), // Placeholder for No Ads
      ],
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF8B4513), // SaddleBrown
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFD4A373), width: 3),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(2, 2),
            blurRadius: 4,
          )
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }

  Widget _buildPlayButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/game');
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.green[600],
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(4, 4),
              blurRadius: 8,
            )
          ],
        ),
        child: const Icon(Icons.play_arrow, color: Colors.white, size: 50),
      ),
    );
  }
}
