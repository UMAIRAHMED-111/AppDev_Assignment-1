import 'package:flutter/material.dart';

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

                // Row with Rotated Arrow and Comment
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: 3.14 / 2, // Same arrow rotation as before
                      child: const Icon(Icons.subdirectory_arrow_left, size: 22, color: Colors.grey),
                    ),
                    const SizedBox(width: 5),
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
