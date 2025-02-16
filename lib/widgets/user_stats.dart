import 'package:flutter/material.dart';

class UserStats extends StatelessWidget {
  final int posts;
  final int comments;

  const UserStats({super.key, required this.posts, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStatItem(posts.toString(), "Posts"),
          const SizedBox(width: 40),
          _buildStatItem(comments.toString(), "Comments"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFA100), // Orange color for emphasis
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}
