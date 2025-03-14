import 'package:final_year_project/screens/adding_pets/create_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kind extends StatefulWidget {
  const Kind({super.key});

  @override
  State<Kind> createState() => _KindState();
}

class _KindState extends State<Kind> {
  String? selectedPet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE1F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFECE1F0),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Text(
                        "What kind of pet do you have?",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPet =
                                    'Dog'; // Set 'Dog' as the selected pet
                              });
                            },
                            child: Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                color: selectedPet == 'Dog'
                                    ? Colors.blue[100]
                                    : Colors.white, // Highlight selected pet
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: selectedPet == 'Dog'
                                      ? Colors.blue
                                      : Colors
                                          .transparent, // Border color for selected pet
                                  width: 3,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/dog.png',
                                    color: Colors.black,
                                    height: 140,
                                  ),
                                  Text(
                                    'Dog',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPet =
                                    'Cat'; // Set 'Cat' as the selected pet
                              });
                            },
                            child: Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                color: selectedPet == 'Cat'
                                    ? Colors.blue[100]
                                    : Colors.white, // Highlight selected pet
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: selectedPet == 'Cat'
                                      ? Colors.blue
                                      : Colors
                                          .transparent, // Border color for selected pet
                                  width: 3,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Image.asset(
                                      'assets/cat.png',
                                      color: Colors.black,
                                      height: 120,
                                    ),
                                  ),
                                  Text(
                                    'Cat',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Next',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                  ),
                  onTap: () {
                    if (selectedPet != null) {
                      // If a pet is selected, navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Create()),
                      );
                    } else {
                      // Show a message if no pet type is selected
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please select a pet type!')),
                      );
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
