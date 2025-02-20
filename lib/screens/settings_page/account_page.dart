import 'package:final_year_project/screens/settings_page/Privacy_page.dart';
import 'package:final_year_project/screens/settings_page/help_support_page.dart';
import 'package:final_year_project/screens/settings_page/pet_info.dart';
import 'package:final_year_project/screens/settings_page/review_page.dart';
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
      backgroundColor: Color(0xFFECE1F0),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Section
            Card(
              elevation: 2,
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child:
                      Icon(Icons.person_2_sharp, size: 30, color: Colors.white),
                ),
                title: Text(
                  'Shiwani Shrestha',
                  style: GoogleFonts.lato(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                // subtitle: TextButton(
                //   onPressed: () {},
                //   child: Text(
                //     'Show Profile',
                //     style: GoogleFonts.lato(color: Colors.deepPurpleAccent),
                //   ),
                // ),
                // trailing: const Icon(Icons.arrow_forward_ios,
                //     size: 25, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),

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
            buildSettingsTile(
              Icons.lock,
              "Privacy and Security",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyAndSecurityScreen()),
                );
              },
            ),
            buildSettingsTile(
              Icons.help_outline,
              "Help and Support",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HelpAndSupportScreen()),
                );
              },
            ),
            buildSettingsTile(
              Icons.rate_review,
              "Review and Recommendations",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReviewPage()),
                );
              },
            ),
            buildSettingsTile(Icons.logout, "Logout", isLogout: true),
          ],
        ),
      ),
    );
  }

  // General Setting Tile
  Widget buildSettingsTile(IconData icon, String title,
      {bool isLogout = false, VoidCallback? onTap}) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
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
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.purple,
        ),
      ),
    );
  }
}
