import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VaccinationBlog extends StatelessWidget {
  const VaccinationBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6CDEA),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: const Color(0xFFD6CDEA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Pet Vaccination Guide",
          style: GoogleFonts.lato(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Why to Vaccinate?",
              style: GoogleFonts.lato(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/vaccinee.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Prevent diseases like rabies and parvo.",
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            _buildCard(
              title: "Common Vaccines",
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPetInfo(
                    title: "Dog",
                    items: const ["1. Rabies", "2. Parvo"],
                  ),
                  _buildPetInfo(
                    title: "Cat",
                    items: const ["1. Feline Herps", "2. Rabies"],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildCard(
              title: "Vaccination Schedule",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• For Puppies/Kittens:",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "  Start at 6-8 weeks",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "• For Adults:",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("  Annual Boosters"),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              "\"Stay proactive—keep your pets safe!\"",
              style: GoogleFonts.lato(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            //offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

  Widget _buildPetInfo({required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        ...items.map(
          (item) => Text(
            item,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
