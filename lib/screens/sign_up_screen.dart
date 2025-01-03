import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_application/model/user.dart';
import 'package:money_application/screens/otp_screen.dart';
import 'package:money_application/widget/get_started_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordVisible = false;

  void _validateEmail(String input) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    setState(() {
      _isEmailValid = emailRegex.hasMatch(input);
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void validateUserCredentials(String emailInput, String passwordInput) {
    UserModel user = UserModel(email: emailInput, password: passwordInput);
    if (user.isValidEmail() && user.isPasswordValid()) {
      print('Valid credentials');
    } else {
      print('Invalid credentials');
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
            child: Form(
              key: _formKey,
              child: Column(children: [
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
                      'Sign up',
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
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (emailAddress) {
                            if (emailAddress == null || emailAddress.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
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
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter your password';
                            } else if (password.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
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
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (confirmPasswordController) {
                            if (confirmPasswordController == null ||
                                confirmPasswordController.isEmpty) {
                              return 'Please confirm your password';
                            } else if (confirmPasswordController !=
                                _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          controller: _confirmPasswordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            label: const Text(
                              'Confirm Password',
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Otp(),
                              ),
                            );
                           
                          }
                        },
                        child: SecondGradientbutton(
                          width: 350,
                          height: 75,
                          text: 'Sign Up',
                          sizedBoxWidth: 200,
                        ))
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
