// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_application/model/user.dart';
import 'package:money_application/screens/otp_screen.dart';
import 'package:money_application/widget/get_started_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordVisible = false;
  bool _hasEmailBeenEdited = false;


  void _validateEmail(String input) {
    UserModel user =
        UserModel(email: input, password: _passwordController.text);
    setState(() {
      _hasEmailBeenEdited = true;
      _isEmailValid = user.isValidEmail();
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void validateUserCredentials(String emailInput, String passwordInput) {
    UserModel user = UserModel(email: emailInput, password: passwordInput);
    if (user.isValidEmail()) {
      print('Its valid');
    } else {
      print('NOPE');
    }
    if (user.isPasswordValid()) {
      print('Its valid');
    } else {
      print('NOPE');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Stack(
                  children: [
                    Image.asset(
                        width: 340, 'assets/images/large-start-logo.png'),
                    Positioned(
                      top: 40,
                      left: 40,
                      child: Image.asset(
                          width: 100, 'assets/images/Logo-White 1.png'),
                    ),
                    Positioned(
                      top: 130,
                      left: 60,
                      child: Text(
                        'Welcome \n Back',
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  autocorrect: false,
                  cursorColor: const Color.fromRGBO(39, 67, 253, 1),
                  controller: _emailController,
                  decoration: InputDecoration(
                    errorText: _hasEmailBeenEdited && !_isEmailValid ? 'Invalid Email Address': null,
                    label: const Text(
                      'Email Address',
                      style: TextStyle(
                        color: Color.fromRGBO(185, 185, 185, 1),
                        fontSize: 18,
                      ),
                    ),
                    suffixIcon: _isEmailValid
                        ? const Icon(Icons.check,
                            color: Color.fromARGB(255, 194, 65, 216))
                        : null,
                  ),
                  onChanged: _validateEmail,
                ),
              ),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  autocorrect: false,
                  cursorColor: const Color.fromRGBO(39, 67, 253, 1),
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    label: const Text(
                      'Password',
                      style: TextStyle(
                        color: Color.fromRGBO(185, 185, 185, 1),
                        fontSize: 18,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  print('Forgot Password clicked');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromRGBO(43, 71, 252, 1),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 GestureDetector(
                  onTap: () {
                    if (_isEmailValid) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp()));
                    }
                  },
                  child: SecondGradientbutton(text: 'Sign in', width: 350, height: 75, sizedBoxWidth: 200,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





