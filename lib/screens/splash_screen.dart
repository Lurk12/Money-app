import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_application/screens/onboarding_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 10),
      () {
        // Navigate to main screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboaringScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(width: 100, 'assets/images/combined-shape.png'),
            Text('MONEY',
                style: GoogleFonts.montserrat(
                  color: Colors.purple,
                  fontSize: 25,
                ))
          ],
        ),
      ),
    );
  }
}
