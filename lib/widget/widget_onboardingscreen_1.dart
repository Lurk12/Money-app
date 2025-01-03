import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_application/widget/gradientbutton.dart';


class OnboaringScreen1 extends StatelessWidget {
  const OnboaringScreen1({super.key, required this.controller});



  final PageController controller; 

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
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
              Image.asset('assets/images/Saving 1.png'),
              const SizedBox(
                height: 70,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    heightFactor: 1.10,
                    child: Image.asset('assets/images/Ellipse 10.png')),
                  Positioned(
                    left: 20,
                    top: 95,
                    child: Text(
                      'Save your money\nconveniently',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: const Color.fromRGBO(39, 67, 253, 1)),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 170,
                    child: Text(
                      'Get 5% cash back for each\ntransaction and spend it easily.',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: const Color.fromRGBO(124, 42, 255, 1)),
                    ),
                  ),
                  Positioned(
                      right: 20,
                      bottom: 95,
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