import 'package:flutter/material.dart';

class ScrollablePosts extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      "title": "App Dev Assignment",
      "date": "16 Feb 2025, 11:55 PM",
      "location": "IBA Karachi",
      "author": "John Foe",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToeAjnEcL5B2q6pjqHmJ8-qHngbANqCE6hFw&s", // Replace with actual image URLs
    },
    {
      "title": "Tech Conference",
      "date": "30 November 2024, 9:00 AM",
      "location": "13th Street, Park Avenue",
      "author": "John Doe",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToeAjnEcL5B2q6pjqHmJ8-qHngbANqCE6hFw&s",
    },
        {
      "title": "App Dev Assignment",
      "date": "16 Feb 2025, 11:55 PM",
      "location": "IBA Karachi",
      "author": "John Foe",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToeAjnEcL5B2q6pjqHmJ8-qHngbANqCE6hFw&s", // Replace with actual image URLs
    },
    {
      "title": "Seminar",
      "date": "30 November 2024, 9:00 AM",
      "location": "13th Street, Park Avenue",
      "author": "John Doe",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToeAjnEcL5B2q6pjqHmJ8-qHngbANqCE6hFw&s",
    },
    // Add more events here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];

        return Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Image (Left Side)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    event["image"]!,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12), // Spacing

                // Event Details (Right Side)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Event Title
                      Text(
                        event["title"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4), // Small spacing

                      // Event Details (Smaller, Lighter Text)
                      Text(
                        "${event["date"]}\n${event["location"]}\n${event["author"]}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
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
