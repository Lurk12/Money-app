import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_application/screens/welcome_screen.dart';
import 'package:money_application/widget/gradientbutton.dart';

class Onboardingscreen3 extends StatelessWidget {
  const Onboardingscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/combined-shape.png',
                width: 80,
                height: 120,
              ),
              Image.asset(
                'assets/images/Trading 1.png',
                height: 200,
              ),
              const SizedBox(
                height: 70,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/Ellipse 10.png'),
                  Positioned(
                    left: 20,
                    top: 85,
                    child: Text(
                      'Enjoy commmission-free \nstock trading.',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: const Color.fromRGBO(39, 67, 253, 1)),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 160,
                    child: Text(
                      'Online investing has never been \neasier than it is right now.',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(124, 42, 255, 1)),
                    ),
                  ),
                  Positioned(
                      right: 4,
                      bottom: 45,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const WelcomeScreen(),
                            ),
                          );
                        },
                        child: Gradientbutton(
                          text: '  Get Started',height: 80,width: 220,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
