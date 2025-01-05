import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DashboardButton extends StatelessWidget {
  DashboardButton(
      {super.key, required this.text, this.height = 75, this.width = 170});

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
            borderRadius: BorderRadius.circular(35),
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
                  width: 55,
                ),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 30,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        Positioned(
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(35),
              ),
              child: Image.asset(
                'assets/images/Ellipse 98.png',
              ),
            )),
        Positioned(
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(35),
              ),
              child: Image.asset(
                'assets/images/Ellipse 99.png',
              ),
            ),
            ),
            const Positioned(
              right: 30,
              bottom: 60,
              child: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white, size: 30,),
            ),
      ],
    );
  }
}
