import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_application/screens/input_otp_verification.dart';
import 'package:money_application/widget/get_started_button.dart';

class Otp extends StatelessWidget {
  final TextEditingController _numberController = TextEditingController();
  Otp({super.key,  this.number = ''});
  void dispose() {
    _numberController.dispose();
  }

  
  final String number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                Text(
                  'We will send you a one-time password to \n                    this mobile number',
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Enter Mobile Number',
                  style: TextStyle(color: Color.fromRGBO(185, 185, 185, 1)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _numberController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    if(_numberController.text.isEmpty){
                      return;
                    }else{
                   Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                           EnterOTPNumber(number: _numberController.text,),
                      )); 
                      
                    }
                  },
                  child:SecondGradientbutton (text: '             Get OTP', height: 75,width: 270,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
