import 'package:final_year_project/screens/maps/maps_page.dart';
import 'package:final_year_project/screens/adding_pets/add_tonopets.dart';
import 'package:final_year_project/screens/settings_page/account_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:final_year_project/screens/appointments/appointmentpart.dart';
import 'package:final_year_project/screens/chats_pages/chat_home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const AddPetScreen(key: PageStorageKey('AddPetScreen')),
    const VetLocationScreen(key: PageStorageKey('VetLocationScreen')),
    const DoctorList(key: PageStorageKey('DoctorList')),
    const ChatHome(key: PageStorageKey('ChatHome')),
    const AccountScreen(key: PageStorageKey('AccountScreen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: (5)),
        child: screens[selectedIndex],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: GNav(
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: const Color(0xFFECE1F0),
            gap: 2,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home),
              GButton(icon: Icons.location_on),
              GButton(icon: Icons.calendar_today),
              GButton(icon: Icons.chat),
              GButton(icon: Icons.settings),
            ],
          ),
        ),
      ),
    );
  }
}
