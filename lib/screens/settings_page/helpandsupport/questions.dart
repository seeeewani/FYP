import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

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
          "FAQs",
          style: GoogleFonts.lato(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFAQItem(
              "How do I book a vet appointment?",
              "To book a vet appointment, go to the 'Appointments' section, select a veterinarian, choose a date and time, and confirm your booking.",
            ),
            _buildFAQItem(
              "Can I cancel or reschedule an appointment?",
              "Yes, you can manage your appointments by going to 'My Appointments' and selecting the appointment you want to cancel or reschedule.",
            ),
            _buildFAQItem(
              "How do I access my pet's health records?",
              "Your pet’s health records can be accessed under the 'Health Records' section of the app. You can view past visits, vaccinations, and medical history.",
            ),
            _buildFAQItem(
              "Is there a way to contact a vet for emergencies?",
              "Yes, our app provides an 'Emergency Call' feature that allows you to connect with the nearest available vet instantly.",
            ),
            _buildFAQItem(
              "What payment methods are supported?",
              "We support multiple payment methods, including Khalti, credit/debit cards, and online banking for easy and secure transactions.",
            ),
            _buildFAQItem(
              "How do I leave a review for a veterinarian?",
              "After an appointment, you can leave a review in the 'Reviews & Recommendations' section to share your experience with the vet.",
            ),
            _buildFAQItem(
              "Is my personal data secure in the app?",
              "Yes, we prioritize user privacy and security. Your personal data is encrypted and stored securely, and we do not share it with third parties.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 1,
        //     //offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: ExpansionTile(
        iconColor: Colors.deepPurple,
        collapsedIconColor: Colors.black,
        title: Text(
          question,
          style: GoogleFonts.lato(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              answer,
              style: GoogleFonts.lato(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
