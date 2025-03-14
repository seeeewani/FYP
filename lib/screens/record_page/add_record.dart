import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class Record {
  final String type;
  final DateTime admissionDate;
  final DateTime expirationDate;
  final String notes;
  final List<String> files;
  final bool hasReminder;
  final DateTime? reminderDate;
  final TimeOfDay? reminderTime;

  Record({
    required this.type,
    required this.admissionDate,
    required this.expirationDate,
    required this.notes,
    required this.files,
    required this.hasReminder,
    this.reminderDate,
    this.reminderTime,
  });
}

class _AddRecordState extends State<AddRecord> {
  // List of record types
  final List<String> _recordTypes = ['Medical', 'Academic', 'Personal', 'Work'];
  String? _selectedRecordType;

  // Form data
  DateTime? _admissionDate;
  DateTime? _expirationDate;
  final TextEditingController _notesController = TextEditingController();
  bool _isReminderEnabled = false;
  DateTime? _reminderDate;
  TimeOfDay? _reminderTime;
  final List<String> _uploadedFiles = [];

  bool _validateForm() {
    if (_selectedRecordType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a record type')),
      );
      return false;
    }
    if (_admissionDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select admission date')),
      );
      return false;
    }
    if (_expirationDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select expiration date')),
      );
      return false;
    }
    if (_isReminderEnabled &&
        (_reminderDate == null || _reminderTime == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please set reminder date and time')),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE1F0),
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
              _buildDateRow("Admission Date", _admissionDate),
              const SizedBox(height: 12),
              _buildDateRow("Expiration Date", _expirationDate),
              const SizedBox(height: 15),
              _buildNotesField(),
              const SizedBox(height: 15),
              _buildFileUploadRow(),
              if (_uploadedFiles.isNotEmpty) ...[
                const SizedBox(height: 10),
                _buildFileList(),
              ],
              const SizedBox(height: 15),
              _buildReminderNotificationRow(),
              const SizedBox(height: 10),
              if (_isReminderEnabled) _buildReminderDateRow(),
              const SizedBox(height: 18),
              _buildCreateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 20),
        Text("Add a Record",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20)),
      ],
    );
  }

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
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: _selectedRecordType,
            hint: Text("Select a record type",
                style: GoogleFonts.poppins(fontSize: 14)),
            underline: const SizedBox(),
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

  Widget _buildDateRow(String label, DateTime? date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: date ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: Colors.purple,
                      onPrimary: Colors.white,
                      surface: Colors.purple.shade50,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              setState(() {
                if (label == "Admission Date") {
                  _admissionDate = picked;
                } else {
                  _expirationDate = picked;
                }
              });
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date?.toString().split(' ')[0] ?? 'Select Date',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.calendar_today, size: 18, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Notes",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            controller: _notesController,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(12),
              hintText: 'Enter notes here...',
              hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileUploadRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Files",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFileUploadButton(
              "Photo",
              Icons.photo,
            ),
            const SizedBox(width: 15),
            _buildFileUploadButton("Document", Icons.document_scanner),
          ],
        ),
      ],
    );
  }

  Widget _buildFileList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _uploadedFiles
          .map((fileName) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.insert_drive_file, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        fileName,
                        style: GoogleFonts.poppins(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () {
                        setState(() {
                          _uploadedFiles.remove(fileName);
                        });
                      },
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildFileUploadButton(String label, IconData icon) {
    return GestureDetector(
      onTap: () async {
        try {
          final result = await FilePicker.platform.pickFiles(
            type: label == "Photo" ? FileType.image : FileType.any,
            allowMultiple: false,
          );

          if (result != null) {
            setState(() {
              _uploadedFiles.add(result.files.single.name);
            });
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      '${result.files.single.name} uploaded successfully')),
            );
          }
        } catch (e) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error uploading file: $e')),
          );
        }
      },
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }

  Widget _buildReminderNotificationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Reminder Notification",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        Switch(
          value: _isReminderEnabled,
          onChanged: (bool value) {
            setState(() {
              _isReminderEnabled = value;
              if (!value) {
                _reminderDate = null;
                _reminderTime = null;
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildReminderDateRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Reminder Settings",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _reminderDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.purple,
                          onPrimary: Colors.white,
                          surface: Colors.purple.shade50,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null) {
                  setState(() {
                    _reminderDate = picked;
                  });
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today, size: 18, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      _reminderDate?.toString().split(' ')[0] ?? 'Select Date',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: _reminderTime ?? TimeOfDay.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.purple,
                          onPrimary: Colors.white,
                          surface: Colors.purple.shade50,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null) {
                  setState(() {
                    _reminderTime = picked;
                  });
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time, size: 18, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      _reminderTime?.format(context) ?? 'Select Time',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCreateButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (_validateForm()) {
            final newRecord = Record(
              type: _selectedRecordType!,
              admissionDate: _admissionDate!,
              expirationDate: _expirationDate!,
              notes: _notesController.text,
              files: List.from(_uploadedFiles),
              hasReminder: _isReminderEnabled,
              reminderDate: _isReminderEnabled ? _reminderDate : null,
              reminderTime: _isReminderEnabled ? _reminderTime : null,
            );

            Navigator.pop(context, newRecord);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Create',
          style: GoogleFonts.lato(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }
}
