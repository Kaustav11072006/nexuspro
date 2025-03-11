import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';
import 'my_network.dart';
import 'notifications.dart';
import 'guild.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video")),
      body: const Center(child: Text("Video Page")),

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
          currentIndex: 2, // Set correct index for My Home page
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
