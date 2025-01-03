import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:money_application/screens/profile.dart';
import 'package:money_application/widget/get_started_button.dart';

class EnterOTPNumber extends StatelessWidget {
  const EnterOTPNumber({super.key, required this.number});

  final String number;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Image.asset(width: 200, 'assets/images/holding-phone.png'),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'OTP Verification',
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text.rich(
                  TextSpan(
                  text: 'Enter OTP sent to ',
                  style: GoogleFonts.montserrat(fontSize: 18),
                  children: [
                    TextSpan(
                      text: number,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    )
                  ]
                ),
                  ),
                const SizedBox(
                  height: 50,
                ),
                OtpTextField(

                  numberOfFields: 4,
                  borderColor: const Color.fromRGBO(185, 185, 185, 1),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I didn't get the OTP?",
                      style: TextStyle(
                          color: Color.fromRGBO(185, 185, 185, 1),
                          fontSize: 16),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const Text(
                        'Resend OTP',
                        style: TextStyle(
                          color: Color.fromRGBO(39, 67, 254, 1),
                          fontSize: 16
                        ),
                      ),
                      onTap: () {
                      
                      },
                    )
                  ],
                ),
                const SizedBox(height: 50,),
                GestureDetector(
                  onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const ProfileScreen();
                  },));
                  },
                  child: SecondGradientbutton(
                      text: '   Verify',
                      sizedBoxWidth: 30,
                      ),
                ),
                   
              ],
            ),
          ),
        ),
      ),
    );
  }
}
