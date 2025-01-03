import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SecondGradientbutton extends StatelessWidget {
   SecondGradientbutton(
      {super.key, required this.text, this.height = 75, this.width = 190, this.sizedBoxWidth=18});

  final String text;
   double height;
   double width;
   double sizedBoxWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(73, 96, 249, 1),
              Color.fromRGBO(20, 51, 255, 1),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(32),
          ),
          height: height,
          width: width,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                Padding(
                
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Text(
                    text,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                 SizedBox(
                  width: sizedBoxWidth,
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 25,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 1,
          child: Image.asset(
            'assets/images/Mask group.png',
          ),
        )
      ],
    );
  }
}
