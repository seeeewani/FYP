import 'package:final_year_project/screens/appointments/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 45,
              width: 3000,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  hintText: "Search",
                  hintStyle: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 22,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: doctorList.length,
              itemBuilder: (context, index) {
                final doctor = doctorList[index];
                return Column(
                  children: [
                    DoctorCard(
                      image: doctor['image']!,
                      name: doctor['name']!,
                      specialization: doctor['specialization']!,
                      rating: doctor['rating']!,
                      distance: doctor['distance']!,
                      description: doctor['description']!,
                    ),
                    const SizedBox(height: 6),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String specialization;
  final String rating;
  final String distance;
  final String description;

  const DoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.distance,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 140,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  specialization,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.pets, size: 16, color: Colors.black),
                    const SizedBox(width: 6),
                    Text(rating),
                    const SizedBox(width: 16),
                    const Icon(Icons.location_on,
                        size: 16, color: Colors.black),
                    const SizedBox(width: 6),
                    Text(distance),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  maxLines: 7,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DoctorDetail()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8, 8, 18, 7),
                        margin: const EdgeInsets.only(right: 0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1C2E0),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black, width: 0),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Book an appointment",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 0),
                            const Icon(
                              Icons.arrow_right_alt,
                              color: Colors.black,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.phone_in_talk),
                    //   color: Colors.black,
                    //   iconSize: 25,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Example list of doctors
const List<Map<String, String>> doctorList = [
  {
    'image': 'assets/dr.neha.png',
    'name': 'Dr. Neha Shrestha',
    'specialization': 'Veterinary Behavioral',
    'rating': '4.5',
    'distance': '5km',
    'description':
        '"Dr. Neha Shrestha is a highly experienced veterinarian with 10 years of dedicated practice."',
  },
  {
    'image': 'assets/dr.ravi.png',
    'name': 'Dr. Ravi Kulkarni',
    'specialization': 'Veterinary Orthopedics',
    'rating': '4.5',
    'distance': '5km',
    'description':
        '"Dr. Ravi Kulkarni is a seasoned orthopedic surgeon with over 15 years of medical excellence."',
  },
  {
    'image': 'assets/pets.png',
    'name': 'Dr. Aisha Khan',
    'specialization': 'Veterinary Dermatology',
    'rating': '4.5',
    'distance': '5km',
    'description':
        '"Dr. Aisha Khan, a renowned dermatologist, has 12 years of experience delivering innovative skincare solutions."',
  },
];
