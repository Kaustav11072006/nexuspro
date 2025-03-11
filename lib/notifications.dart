import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';
import 'my_network.dart';
import 'video.dart';
import 'guild.dart';
import 'profile.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            border: Border.all(
              color: const Color.fromARGB(
                255,
                230,
                45,
                199,
              ), // Neon border color
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 216, 64, 246).withOpacity(0.8),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // Remove shadow from AppBar
            title: const Text(
              'Notifications',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.message, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),

      // Drawer Section with Dark Purple
      drawer: Drawer(
        backgroundColor: Colors.deepPurple.shade700, // Drawer background color
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple, // Drawer header background color
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ), // Profile image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'RGgaming',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Esports Player',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Get.to(
                  () => const ProfilePage(),
                ); // Use Get.to instead of Get.offAll
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: const Center(child: Text("Notifications Page")),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple, // Background color
          border: Border.all(
            color: const Color.fromARGB(255, 230, 45, 199), // Neon border color
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 216, 64, 246).withOpacity(0.8),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor:
              Colors
                  .transparent, // Transparent so that Container's color is visible
          selectedItemColor: const Color.fromARGB(
            255,
            230,
            45,
            199,
          ), // Selected icon color
          unselectedItemColor: Colors.blue, // Unselected icon color
          currentIndex: 3, // Set correct index for My Home page
          type: BottomNavigationBarType.fixed, // Fix shifting issue
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'My Network',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Guild'),
          ],
          onTap: (index) {
            if (index == 0) {
              Get.offAll(() => const MyHomePage());
            } else if (index == 1) {
              Get.offAll(() => const MyNetwork());
            } else if (index == 2) {
              Get.offAll(() => const Video());
            } else if (index == 3) {
              Get.offAll(() => const Notifications());
            } else if (index == 4) {
              Get.offAll(() => const Guild());
            }
          },
        ),
      ),
    );
  }
}
