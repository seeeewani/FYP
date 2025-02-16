import 'package:final_year_project/screens/appointments/success_msg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Confirm and Pay',
          style: GoogleFonts.lato(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDoctorCard(),
              const SizedBox(height: 12),
              _buildPromoCodeInput(context), // Pass context here
              const SizedBox(height: 12),
              _buildAppointmentDetails(),
              const SizedBox(height: 12),
              const Text(
                'Payment Method',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              _buildPaymentMethodCard(),
              const SizedBox(height: 16),
              _buildPayButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard() {
    return Card(
      child: ListTile(
        leading: Image.asset(
          'assets/dr.neha.png',
          width: 85,
          height: 180,
        ),
        title: Text(
          'Dr. Neha Shrestha',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Veterinary Behavioral',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              'Itahari, Sunsari',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCodeInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_offer_outlined),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Promo Code',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Here you can handle promo code application logic
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Promo code applied!')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scheduled Appointment',
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DetailRow(title: 'Full Name', value: 'Shiwani Shrestha'),
            DetailRow(title: 'Date', value: '10th July, 2024'),
            DetailRow(title: 'Time', value: '8:00 - 10:00 AM'),
            DetailRow(title: 'Promo Code', value: 'SIPWJMM'),
            DetailRow(title: 'Total Price', value: 'Rs. 1500'),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard() {
    return Card(
      child: ListTile(
        leading: Image.asset(
          'assets/khalti.png',
          width: 120,
          height: 40,
          fit: BoxFit.cover,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          //print("Payment method selected");
        },
      ),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SuccessMsg()),
          );

          //print("Proceed to payment");
        },
        child: Text(
          'Pay Now',
          style: GoogleFonts.poppins(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String title;
  final String value;

  const DetailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(color: Colors.grey[700]),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
