import 'package:final_year_project/screens/appointments/appointments.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetail extends StatelessWidget {
  const DoctorDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFECE1F0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Doctor Details",
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        //centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.favorite_border_sharp,
        //         size: 28, color: Colors.black),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Image
              Container(
                height: 200,
                width: 560,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipPath(
                  //borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/dr.png',
                    fit: BoxFit.fill, // Changed from contain to cover
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Doctor Name and Location
              Text(
                "Dr. Aisha Khan",
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.purple, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "Itahari, Sunsari",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Stats Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  StatCard(
                    icon: Icons.groups,
                    label: "2000+",
                    subLabel: "Patients",
                  ),
                  StatCard(
                    icon: Icons.calendar_today,
                    label: "5+",
                    subLabel: "Years Exp.",
                  ),
                  StatCard(
                    icon: Icons.star_border,
                    label: "4+",
                    subLabel: "Rating",
                  ),
                  StatCard(
                    icon: Icons.comment_sharp,
                    label: "1,000",
                    subLabel: "Reviews",
                  ),
                ],
              ),
              const SizedBox(height: 17),

              // About Section
              Text(
                "About",
                style: GoogleFonts.lato(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Dr. Aisha Khan, a renowned dermatologist, has 12 years of experience with a focus on aesthetic procedures and treating complex skin disorders.",
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Book Appointment Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppointmentScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(
                  "Book Appointment",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subLabel;

  const StatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.subLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, size: 28, color: Colors.purple),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subLabel,
          style: GoogleFonts.lato(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
