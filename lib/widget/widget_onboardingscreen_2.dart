import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_application/widget/gradientbutton.dart';


class Onboardingscreen2 extends StatelessWidget{
  const Onboardingscreen2({super.key, required this.controller});

 final PageController controller;

   

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
         physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Image.asset(
                'assets/images/combined-shape.png',
                width: 80,
                height: 120,
              ),
              Image.asset('assets/images/Safety Box 1.png', height: 200,),
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
                      'Secure your money for \nfree and get rewards.',
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
                      'Get the most secure payment app \never and enjoy it.',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(124, 42, 255, 1)),
                    ),
                  ),
                  Positioned(
                      right: 4,
                      bottom: 45,
                      child:GestureDetector (
                        onTap: (){
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        },
                        child: Gradientbutton(
                          text: '    Next',
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      );
  }


}