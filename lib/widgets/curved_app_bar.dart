import 'package:flutter/material.dart';
import 'dart:math';

class CurvedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Very thin, subtle border effect
        ClipPath(
          clipper: SineWaveClipper(),
          child: Container(
            height: 222, // Just 2 pixels more than main bar
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15), // Very subtle border
            ),
          ),
        ),
        // Main Curved App Bar
        ClipPath(
          clipper: SineWaveClipper(),
          child: Container(
            height: 220,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFF176), Color(0xFFFFA100)], // Bright Yellow to Dark Yellow
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SineWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40); // Start at bottom left

    double waveHeight = 30; // Height of the wave
    double frequency = 2; // Number of sine waves

    for (double i = 0; i <= size.width; i++) {
      double y = sin(((size.width - i) / size.width) * pi * frequency) * waveHeight + (size.height - 40);
      path.lineTo(i, y);
    }

    path.lineTo(size.width, 0); // Close at the top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
