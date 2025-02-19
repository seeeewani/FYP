import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetInfoScreen extends StatelessWidget {
  const PetInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6CDEA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6CDEA),
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Pet Information',
          style: GoogleFonts.lato(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pet Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/meow.png',
                width: 500,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 5),

            // Pet Name and Type
            Text(
              'kiyo',
              style: GoogleFonts.lato(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Orange Cat',
              style: GoogleFonts.lato(
                fontSize: 18,
                color: Colors.blueGrey,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 24),

            // Pet Details Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 2.5,
              children: [
                _buildInfoCard('Age', '3 months'),
                _buildInfoCard('Gender', '♀'),
                _buildInfoCard('Weight', '5kg'),
                _buildInfoCard('Colour', 'Orange'),
                _buildInfoCard('Pet Card Number', '023'),
                _buildInfoCard('Sterilization Date', '2024-4-30'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
