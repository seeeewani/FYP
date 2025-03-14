import 'package:final_year_project/screens/record_page/notification_permission.dart';
//import 'package:final_year_project/screens/record_page/notify.dart';
import 'package:final_year_project/screens/settings_page/helpandsupport/help_support_page.dart';
import 'package:final_year_project/screens/settings_page/pet_info.dart';
import 'package:final_year_project/screens/settings_page/privacyandsecurity/privacy_page.dart';
import 'package:final_year_project/screens/settings_page/review_page.dart';
import 'package:final_year_project/screens/starting%20pages/get_started.dart';
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
        backgroundColor: Color(0xFFECE1F0),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPermissionPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Section with BoxDecoration
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                //border: Border.all(color: Colors.purple, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
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
              ),
            ),
            const SizedBox(height: 10),

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
            buildSettingsTile(Icons.logout, "Logout", isLogout: true,
                onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnLoadingScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  // General Setting Tile with BoxDecoration
  Widget buildSettingsTile(IconData icon, String title,
      {bool isLogout = false, VoidCallback? onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
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

  // Toggle Switch Tile with BoxDecoration
  Widget buildSwitchTile(
      IconData icon, String title, bool value, Function(bool) onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
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
          activeColor: Color.fromARGB(255, 100, 14, 132),
        ),
      ),
    );
  }
}
