import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_application/screens/sign_in_screen.dart';
import 'package:money_application/screens/sign_up_screen.dart';
import 'package:money_application/widget/get_started_button.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Image.asset(width: 500, 'assets/images/small-start-logo.png'),
              Positioned(
                top: 60,
                left: 45,
                child:
                    Image.asset(width: 100, 'assets/images/Logo-White 1.png'),
              ),
              Positioned(
                top: 150,
                left: 60,
                child: Text(
                  'Welcome \n Back',
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: SecondGradientbutton(
                      text: '     Sign in',
                      width: 300,
                      sizedBoxWidth: 105,
                    ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                        fixedSize: const Size(305, 70),
                        iconColor: const Color.fromARGB(255, 47, 50, 154),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 47, 50, 154),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        )
                   
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign up',
                        style: GoogleFonts.montserrat(fontSize: 20, color:const Color.fromARGB(255, 47, 50, 154)),
                        
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.arrow_forward), // Arrow icon
                    ],
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
