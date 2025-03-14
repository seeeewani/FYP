import 'package:final_year_project/screens/appointments/success_msg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmScreen extends StatefulWidget {
  final TimeOfDay time;
  final DateTime date;
  final String service;
  final String vet;
  final String reason;
  final String type;
  const ConfirmScreen({
    super.key,
    required this.time,
    required this.date,
    required this.service,
    required this.vet,
    required this.reason,
    required this.type,
  });
  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final TextEditingController _promoController = TextEditingController();
  double _totalPrice = 1500;
  double _discount = 0;
  bool _isPromoApplied = false;

  void _applyPromoCode(String code) {
    // Mock promo codes for demonstration
    final Map<String, double> promoCodes = {
      'FIRST20': 0.20,
      'SAVE10': 0.10,
      'VET15': 0.15,
    };

    if (promoCodes.containsKey(code)) {
      setState(() {
        _discount = _totalPrice * promoCodes[code]!;
        _totalPrice = _totalPrice - _discount;
        _isPromoApplied = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Promo code applied! You saved Rs. ${_discount.toStringAsFixed(2)}'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid promo code!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD1C2E0),
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
          widget.vet,
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
        border: Border.all(
            color: _isPromoApplied ? Colors.green : Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(Icons.local_offer_outlined,
              color: _isPromoApplied ? Colors.green : Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _promoController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    _isPromoApplied ? 'Promo Code Applied' : 'Enter Promo Code',
                hintStyle: TextStyle(
                    color: _isPromoApplied ? Colors.green : Colors.grey),
              ),
              enabled: !_isPromoApplied,
            ),
          ),
          IconButton(
            icon: Icon(
              _isPromoApplied ? Icons.check_circle : Icons.arrow_forward,
              color: _isPromoApplied ? Colors.green : Colors.grey,
            ),
            onPressed: _isPromoApplied
                ? null
                : () {
                    if (_promoController.text.isNotEmpty) {
                      _applyPromoCode(_promoController.text.toUpperCase());
                    }
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
            const SizedBox(height: 16),
            DetailRow(title: 'Appointment Type', value: widget.type),
            DetailRow(title: 'Service', value: widget.service),
            DetailRow(title: 'Reason', value: widget.reason),
            DetailRow(
                title: 'Date',
                value:
                    '${widget.date.day}/${widget.date.month}/${widget.date.year}'),
            DetailRow(
                title: 'Time',
                value:
                    '${widget.time.hour.toString().padLeft(2, '0')}:${widget.time.minute.toString().padLeft(2, '0')}'),
            if (_isPromoApplied)
              DetailRow(
                title: 'Discount',
                value: '- Rs. ${_discount.toStringAsFixed(2)}',
              ),
            DetailRow(
              title: 'Total Price',
              value: 'Rs. ${_totalPrice.toStringAsFixed(2)}',
            ),
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
