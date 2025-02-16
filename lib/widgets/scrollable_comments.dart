import 'package:flutter/material.dart';
import 'dart:ui';

class ScrollableComments extends StatelessWidget {
  final List<Map<String, String>> comments = [
    {"title": "Flutter Flash", "text": "Looks like an amazing event!", "date": "30 November 2024, 11:00 PM"},
    {"title": "Tech Meetup", "text": "Excited to join this one!", "date": "15 March 2025, 7:30 PM"},
    {"title": "Workshop on Dart", "text": "Great opportunity to learn!", "date": "10 April 2025, 3:00 PM"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];

        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title (Bold)
                Text(
                  comment["title"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                // Row with Custom Painted Curved Arrow and Comment
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Custom Drawn Curved Arrow
                    CustomPaint(
                      size: const Size(20, 20),
                      painter: CurvedArrowPainter(),
                    ),
                    const SizedBox(width: 5),

                    // Comment Text
                    Expanded(
                      child: Text(
                        "\"${comment["text"]!}\"",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // Date (Gray and Small)
                Text(
                  comment["date"]!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CurvedArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey // Arrow color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path();

    // Start from bottom (curved part)
    path.moveTo(size.width * 0.8, size.height);
    path.quadraticBezierTo(
      size.width * 0.2, size.height, // Control point for the curve
      size.width * 0.2, size.height * 0.5, // Mid-point before going up
    );

    // Vertical upward line
    path.lineTo(size.width * 0.2, size.height * 0.1);

    // Arrowhead (two short lines forming a tip)
    path.moveTo(size.width * 0.1, size.height * 0.2);
    path.lineTo(size.width * 0.2, size.height * 0.1);
    path.lineTo(size.width * 0.3, size.height * 0.2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
