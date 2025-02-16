import 'package:final_year_project/screens/Add_pet/addhome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  // List of record types
  final List<String> _recordTypes = ['Medical', 'Academic', 'Personal', 'Work'];
  String? _selectedRecordType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 12),
              _buildDropdownField("Record Type", _recordTypes),
              const SizedBox(height: 12),
              _buildDateRow("Admission Date", "10-Mar-2024"),
              const SizedBox(height: 12),
              _buildDateRow("Expiration Date", "10-Apr-2024"),
              const SizedBox(height: 15),
              _buildNotesField(),
              const SizedBox(height: 15),
              _buildFileUploadRow(),
              const SizedBox(height: 15),
              _buildReminderNotificationRow(),
              const SizedBox(height: 10),
              _buildReminderDateRow(),
              const SizedBox(height: 18),
              _buildCreateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Header with back button
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(CupertinoIcons.back, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 40),
        Text("Add a Record",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20)),
      ],
    );
  }

  // Dropdown for record type selection
  Widget _buildDropdownField(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: _selectedRecordType,
            hint: Text("Select a record type",
                style: GoogleFonts.poppins(fontSize: 14)),
            underline: const SizedBox(), // Remove the default underline
            items: options.map((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type, style: GoogleFonts.poppins(fontSize: 14)),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedRecordType = value;
              });
            },
          ),
        ),
      ],
    );
  }

  // Date Row for Admission & Expiration Dates
  Widget _buildDateRow(String label, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Text(date,
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
      ],
    );
  }

  // Notes input field
  Widget _buildNotesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Notes",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 5),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
          ),
        ),
      ],
    );
  }

  // File upload row with Photo & Document buttons
  Widget _buildFileUploadRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Files",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildFileUploadButton("Photo", CupertinoIcons.camera_fill),
            const SizedBox(width: 10),
            _buildFileUploadButton("Document", CupertinoIcons.doc_fill),
          ],
        ),
      ],
    );
  }

  // File upload button template
  Widget _buildFileUploadButton(String label, IconData icon) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 8),
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ],
      ),
    );
  }

  // Reminder notification row
  Widget _buildReminderNotificationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Reminder Notification",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        ElevatedButton(
          onPressed: () {}, // Implement reminder functionality
          child: Text("Enable"),
        ),
      ],
    );
  }

  // Reminder date selection row
  Widget _buildReminderDateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Reminder Date",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        Row(
          children: [
            _buildDateContainer("05/04/..."),
            const SizedBox(width: 10),
            _buildDateContainer("9:15 PM"),
          ],
        ),
      ],
    );
  }

  // Date display container
  Widget _buildDateContainer(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(5)),
      child: Text(text,
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black)),
    );
  }

  // Create button
  Widget _buildCreateButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHomeScreen()),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(12)),
          child: Text("Create",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
