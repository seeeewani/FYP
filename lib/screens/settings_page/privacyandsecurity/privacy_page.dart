// ignore: file_names
//import 'package:final_year_project/screens/settings_page/manage.dart';
import 'package:final_year_project/screens/settings_page/privacyandsecurity/manage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  const PrivacyAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Privacy & Security",
          style: GoogleFonts.lato(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // // Privacy & Security Section
            // Text(
            //   "Privacy & Security Settings",
            //   style: GoogleFonts.lato(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black),
            // ),
            const SizedBox(height: 10),

            buildSettingsTile(
              context,
              Icons.lock_outline,
              "Change Password",
              () {},
            ),
            buildSettingsTile(
              context,
              Icons.security,
              "Manage Account Security",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageAccountPage()),
                );
              },
            ),
            buildSettingsTile(
              context,
              Icons.verified_user_outlined,
              "Enable Two-Factor Authentication",
              () {},
            ),
          ],
        ),
      ),
    );
  }

  // Settings Tile Widget
  Widget buildSettingsTile(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 3, offset: const Offset(0, 2)),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 20),
        onTap: onTap,
      ),
    );
  }
}
