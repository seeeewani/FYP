import 'package:final_year_project/screens/settings_page/pet_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isPushNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E8FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.lato(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined,
                size: 28, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 3,
                      offset: const Offset(0, 1)),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, size: 35, color: Colors.white),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shiwani Shrestha',
                        style: GoogleFonts.lato(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        child: Text('Show Profile',
                            style: GoogleFonts.lato(
                                color: Colors.deepPurpleAccent)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios,
                      size: 30, color: Colors.black),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Settings Section
            buildSettingsTile(
              Icons.pets_sharp,
              "Pet Information",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PetInfoScreen()),
                );
              },
            ),
            buildSwitchTile(Icons.notifications_active, "Push Notifications",
                isPushNotificationEnabled, (value) {
              setState(() {
                isPushNotificationEnabled = value;
              });
            }),
            buildSettingsTile(Icons.lock, "Privacy and Security"),
            buildSettingsTile(Icons.help_outline, "Help and Support"),
            buildSettingsTile(Icons.rate_review, "Review and Recommendations"),
            buildSettingsTile(Icons.logout, "Logout", isLogout: true),
          ],
        ),
      ),
    );
  }

  // General Setting Tile
  Widget buildSettingsTile(IconData icon, String title,
      {bool isLogout = false, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black, blurRadius: 1, offset: const Offset(0, 1)),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.black : Colors.black),
        title: Text(
          title,
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing:
            isLogout ? null : const Icon(Icons.arrow_forward_ios, size: 20),
        onTap: onTap,
      ),
    );
  }

  // Toggle Switch Tile
  Widget buildSwitchTile(
      IconData icon, String title, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black, blurRadius: 1, offset: const Offset(0, 1)),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.purpleAccent,
        ),
      ),
    );
  }
}
