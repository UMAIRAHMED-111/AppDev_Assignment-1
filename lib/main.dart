import 'package:flutter/material.dart';
import 'widgets/curved_app_bar.dart';
import 'widgets/scrollable_posts.dart';
import 'widgets/scrollable_comments.dart';
import 'widgets/user_stats.dart';

void main() {
  runApp(const UserProfileApp());
}

class UserProfileApp extends StatelessWidget {
  const UserProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CurvedAppBar(),
              Positioned(
                top: 120,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Container(
                  width: 100, // Diameter (2 * radius)
                  height: 100, // Diameter (2 * radius)
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Black border color
                      width: 4.0, // Border thickness
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://i.seadn.io/gae/lm9ENF0WeNtBVvS_Shmlxty3o3sCx1QDR3LXMpGlaH-iiJaC07U31l_sCWNnAKuDI845sZXHARxHS4xCaHEemAcmcWvQmiaDBR1Ky28?auto=format&dpr=1&w=1000",
                    ),
                    backgroundColor: Colors.transparent, // Ensures only the border is black
                  ),
                ),
              ),

            ],
          ),
          const SizedBox(height: 20),

          const Text(
            "John Doe",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "John Doe exists. John Doe builds. John Doe innovates. What’s next? Only time will tell...  ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 10),

 
          _appBar(),


          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _tabItem("Posts", 0),
            _tabItem("Comments", 1),
            _tabItem("Stats", 2),
          ],
        ),
        const SizedBox(height: 10), // Added margin-bottom

        // Grayish horizontal line with horizontal padding
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Horizontal padding
          child: Divider(
            color: Colors.grey[400], // Light gray color
            thickness: 1.5, // Thickness of the line
          ),
        ),
      ],
    );
  }



  Widget _tabItem(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16, // Keeping size constant
          fontWeight: FontWeight.bold,
          color: selectedTabIndex == index ? Colors.red : Colors.black54, // Only color change
        ),
      ),
    );
  }


  Widget _buildTabContent() {
    if (selectedTabIndex == 0) {
      return ScrollablePosts();
    } else if (selectedTabIndex == 1) {
      return ScrollableComments();
    } else {
      return UserStats(posts: 19, comments: 32);
    }
  }


}