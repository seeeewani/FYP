import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0),
      appBar: AppBar(
        backgroundColor: Color(0xFFECE1F0),
        elevation: 0,
        title: Text(
          'Notifications',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NotificationItem(
              title: 'Upcoming Appointment',
              subtitle:
                  'You have an appointment with Dr. John at 10 AM tomorrow.',
              time: '2 hours ago',
            ),
            const Divider(),
            NotificationItem(
              title: 'Vaccination Reminder',
              subtitle: 'Your pet Kiyo is due for a vaccination tomorrow.',
              time: '1 day ago',
            ),
            const Divider(),
            NotificationItem(
              title: 'Pet Health Record Update',
              subtitle: 'Your pet health record has been updated.',
              time: '3 days ago',
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

// Custom Notification Item Widget
class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(
        Icons.notifications,
        color: Colors.black,
        size: 40,
      ),
      title: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.lato(
          fontSize: 16,
          color: Colors.grey.shade600,
        ),
      ),
      trailing: Text(
        time,
        style: GoogleFonts.lato(
          fontSize: 12,
          color: Colors.grey.shade500,
        ),
      ),
      onTap: () {
        // Handle notification tap if needed
      },
    );
  }
}
