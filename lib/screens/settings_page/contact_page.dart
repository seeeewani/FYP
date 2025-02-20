import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Contact Support",
          style: GoogleFonts.lato(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How can we assist you?",
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),

            // Call Support
            _buildSupportTile(
              icon: Icons.phone_in_talk,
              title: "Call Us",
              subtitle: "+1 234 567 890",
              onTap: () {
                // Handle phone call action
              },
            ),

            // Email Support
            _buildSupportTile(
              icon: Icons.email_outlined,
              title: "Email Support",
              subtitle: "support@vetappcare.com",
              onTap: () {
                // Handle email action
              },
            ),

            const SizedBox(height: 30),
            Center(
              child: Text(
                "Available 24/7 for your support",
                style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.purple, size: 28),
        title: Text(
          title,
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.lato(fontSize: 14, color: Colors.grey),
        ),
        // trailing: const Icon(Icons.arrow_forward_ios, size: 20),
        // onTap: onTap,
      ),
    );
  }
}
