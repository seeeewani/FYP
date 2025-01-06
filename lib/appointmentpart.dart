import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0), // Light purple background
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFECE1F0),
        title: const Text(
          "Booking",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // List of doctor cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                DoctorCard(
                  image: 'assets/dr.neha.png',
                  name: "Dr. Neha Shrestha",
                  specialization: "Veterinary Behavioral",
                  rating: "4.5",
                  distance: "5km",
                  description:
                      "Dr. Neha Shrestha is a highly experienced veterinarian with 10 years of dedicated practice, showcasing exceptional expertise in small animal care and a deep passion for animal welfare.",
                ),
                const SizedBox(height: 16),
                DoctorCard(
                  image: 'assets/dr.ravi.png',
                  name: "Dr. Ravi Kulkarni",
                  specialization: "Veterinary Orthopedics",
                  rating: "4.5",
                  distance: "5km",
                  description:
                      "Dr. Ravi Kulkarni is a seasoned orthopedic surgeon with over 15 years of medical excellence, specializing in advanced joint replacement techniques and patient-centered care.",
                ),
                const SizedBox(height: 16),
                DoctorCard(
                  image: 'assets/pets.png',
                  name: "Dr. Aisha Khan",
                  specialization: "Veterinary Dermatology",
                  rating: "4.5",
                  distance: "5km",
                  description:
                      "Dr. Aisha Khan, a renowned dermatologist, has 12 years of experience delivering innovative skincare solutions, with a focus on aesthetic procedures and treating complex skin disorders.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// DoctorCard Widget
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
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 130,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Doctor Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  specialization,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.pets, size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text(rating),
                    const SizedBox(width: 16),
                    const Icon(Icons.location_on,
                        size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text(distance),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 9, width: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text(
                        "Book an appointment",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB388EB),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.call),
                      color: Colors.black,
                    ),
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
