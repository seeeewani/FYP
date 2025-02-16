import 'package:final_year_project/screens/appointments/confirm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedType;
  String? selectedService;
  String? selectedVet;
  String? selectedReason;

  final vetTypes = ['Emergency', 'Regular Checkup', 'Surgery', 'Vaccination'];
  final services = [
    'General Checkup',
    'Dental Care',
    'Grooming',
    'Vaccination'
  ];
  final vets = ['Dr. Neha Shrestha', 'Dr. Ravi Kulkarni', 'Dr. Aisha Khan'];
  final reasons = ['Fever', 'Injury', 'Regular Checkup', 'Vaccination'];

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
        title: Text('Appointments',
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Date and Time'),
            DateTimePicker(
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              onTimeSelected: (time) {
                setState(() {
                  selectedTime = time;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Veterinary Type'),
            _buildDropdown(
              hint: 'Choose Type',
              value: selectedType,
              items: vetTypes,
              onChanged: (value) => setState(() => selectedType = value),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Service'),
            _buildDropdown(
              hint: 'Choose services',
              value: selectedService,
              items: services,
              onChanged: (value) => setState(() => selectedService = value),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Vet'),
            _buildDropdown(
              hint: 'Choose vet',
              value: selectedVet,
              items: vets,
              onChanged: (value) => setState(() => selectedVet = value),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Reason'),
            _buildDropdown(
              hint: 'eg. fever..',
              value: selectedReason,
              items: reasons,
              onChanged: (value) => setState(() => selectedReason = value),
            ),
            const SizedBox(height: 18),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?)? onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(
          hint,
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        isExpanded: true,
        underline: const SizedBox(),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: 2000,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConfirmScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class DateTimePicker extends StatelessWidget {
  final Function(DateTime) onDateSelected;
  final Function(TimeOfDay) onTimeSelected;

  const DateTimePicker({
    super.key,
    required this.onDateSelected,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  'Select Date',
                  style: GoogleFonts.lato(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.calendar_today, size: 25),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      onDateSelected(date);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  'Select Time',
                  style: GoogleFonts.lato(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.access_time, size: 30),
                  onPressed: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      onTimeSelected(time);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
