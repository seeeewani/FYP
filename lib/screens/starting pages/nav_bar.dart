import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.purple,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: GNav(
            //backgroundColor: Colors.purple,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.black38,
            gap: 8,
            padding: EdgeInsets.all(16),
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                iconSize: 30,
                text: "Home",
                backgroundColor: Colors.black,
              ),
              GButton(
                icon: Icons.location_pin,
                iconSize: 30,
                text: "Location",
                backgroundColor: Colors.black,
              ),
              GButton(
                icon: Icons.menu_book,
                iconSize: 30,
                text: "Booking",
                backgroundColor: Colors.black,
              ),
              GButton(
                icon: Icons.chat_bubble,
                iconSize: 30,
                text: "Chat",
                backgroundColor: Colors.black,
              ),
              GButton(
                icon: Icons.account_circle,
                iconSize: 30,
                text: "Profile",
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
