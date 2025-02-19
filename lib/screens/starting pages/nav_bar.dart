import 'package:final_year_project/screens/maps/maps_page.dart';
import 'package:final_year_project/screens/settings_page/account_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:final_year_project/screens/add/add_tonopets.dart';
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
    AddPetScreen(), // Home
    VetLocationScreen(), // Vet Location
    DoctorList(), //appointments
    ChatHome(), //octor List)
    AccountScreen(), // Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: GNav(
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Color(0xFFD1C4E9),
            gap: 8,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
              //print("Tab changed: $index");
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                iconSize: 30,
                text: "Home",
              ),
              GButton(
                icon: Icons.location_pin,
                iconSize: 30,
                text: "Location",
              ),
              GButton(
                icon: Icons.menu_book,
                iconSize: 30,
                text: "Booking",
              ),
              GButton(
                icon: Icons.chat_bubble_outlined,
                iconSize: 30,
                text: "Chat",
              ),
              GButton(
                icon: Icons.account_circle,
                iconSize: 30,
                text: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
