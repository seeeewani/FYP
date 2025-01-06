import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA),
      body: Stack(
        children: [
          // Main doctor image
          Positioned(
            top: 3,
            left: 0,
            right: 0,
            bottom: 4,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/dr.png', // Replace with your actual asset path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Top bar with doctor name and back button
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 35,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Dr. Neha Shrestha',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Small user video preview
          Positioned(
            top: 100,
            right: 20,
            child: Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 2),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                'assets/pets.png', // Replace with your actual asset path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Call controls at bottom
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCallControl(Icons.mic, Colors.white),
                _buildCallControl(Icons.call_end, Colors.red),
                _buildCallControl(Icons.videocam, Colors.white),
              ],
            ),
          ),

          // Timer
          const Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Text(
              '10:50',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCallControl(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        icon,
        color: color == Colors.white ? Colors.black : Colors.white,
        size: 30,
      ),
    );
  }
}
