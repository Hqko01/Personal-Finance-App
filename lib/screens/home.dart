import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const homeScreen());
}

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 240, 255),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                right: 12,
                bottom: 40,
                left: 12,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Total balance
                    SizedBox(
                      width: double.infinity,
                      height: 160,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 35, 95, 79),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Balance",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(139, 255, 255, 255),
                              ),
                            ),

                            Text(
                              "₺7.700.00",
                              style: GoogleFonts.montserrat(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Percentage increase in income compared to the previous month.
                            Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  Icons.trending_up,
                                  color: const Color.fromARGB(
                                    255,
                                    13,
                                    219,
                                    140,
                                  ),
                                ),
                                Text(
                                  "+12.5% this month",
                                  style: GoogleFonts.montserrat(
                                    color: const Color.fromARGB(
                                      255,
                                      13,
                                      219,
                                      140,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 61, 167, 138),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.south_west,
                                    color: const Color.fromARGB(
                                      255,
                                      91,
                                      252,
                                      209,
                                    ),
                                    size: 20,
                                  ),
                                  Text(
                                    "₺20.975.00",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Income",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      color: const Color.fromARGB(
                                        139,
                                        255,
                                        255,
                                        255,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 240, 255),
                                border: Border.all(
                                  color: const Color.fromARGB(76, 194, 50, 40),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(255, 73, 73, 0.438),
                                    blurRadius: 2,
                                    spreadRadius: 0,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.north_east,
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      77,
                                      77,
                                    ),
                                    size: 20,
                                  ),
                                  Text(
                                    "₺13.275.00",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        77,
                                        77,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Expenses",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      color: const Color.fromARGB(
                                        92,
                                        65,
                                        65,
                                        65,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
