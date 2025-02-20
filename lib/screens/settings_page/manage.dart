import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageAccountPage extends StatefulWidget {
  const ManageAccountPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ManageAccountPageState createState() => _ManageAccountPageState();
}

class _ManageAccountPageState extends State<ManageAccountPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isTwoFactorEnabled = false;

  void _saveChanges() {
    if (_newPasswordController.text == _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password changed successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match! Please try again.')),
      );
    }
  }

  void _toggleTwoFactor() {
    setState(() {
      _isTwoFactorEnabled = !_isTwoFactorEnabled;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isTwoFactorEnabled
            ? 'Two-factor authentication enabled!'
            : 'Two-factor authentication disabled!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFECE1F0),
        elevation: 0.5,
        title: Text(
          'Manage Account Security',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            // Change Password Section
            Container(
              margin: EdgeInsets.symmetric(vertical: 1),
              //padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                //border: Border.all(color: Colors.purple, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildPasswordField(
                      controller: _currentPasswordController,
                      label: 'Current Password'),
                  SizedBox(height: 20), // Increased spacing

                  buildPasswordField(
                      controller: _newPasswordController,
                      label: 'New Password'),
                  SizedBox(height: 20), // Increased spacing

                  buildPasswordField(
                      controller: _confirmPasswordController,
                      label: 'Confirm New Password'),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Enable/Disable Two-Factor Authentication
            Container(
              //padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                //border: Border.all(color: Colors.purple, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SwitchListTile(
                title: Text(
                  'Enable Two-Factor Authentication',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                value: _isTwoFactorEnabled,
                onChanged: (bool value) {
                  _toggleTwoFactor();
                },
              ),
            ),
            SizedBox(height: 20),

            // Save Changes Button
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Save Changes',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordField(
      {required TextEditingController controller, required String label}) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.lato(
          color: Colors.black45,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.purple),
        ),
      ),
    );
  }
}
