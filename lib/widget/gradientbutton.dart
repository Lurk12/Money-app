import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Gradientbutton extends StatelessWidget {
   Gradientbutton({super.key, required this.text, this.height= 75, this.width= 170});

  final String text;
  double height;
  double width;


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
                Text(
                  text,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  width: 45,
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 30,
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
