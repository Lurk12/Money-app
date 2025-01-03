import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_application/screens/dashboard.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;


  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isUsernameValid = false;
  bool _isFirstNameValid = false;
  bool _isLastNameValid = false;
  bool _isDobValid = false;

  
  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _isUsernameValid = _usernameController.text.isNotEmpty;
        _validateFields();
      });
    });
    _firstNameController.addListener(() {
      setState(() {
        _isFirstNameValid = _firstNameController.text.isNotEmpty;
        _validateFields();
      });
    });
    _lastNameController.addListener(() {
      setState(() {
        _isLastNameValid = _lastNameController.text.isNotEmpty;
        _validateFields();
      });
    });
    _dobController.addListener(() {
      setState(() {
        _isDobValid = _dobController.text.isNotEmpty;
        _validateFields();
      });
    });
  }


  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _validateFields() {
    setState(() {
      _isButtonEnabled = _isFirstNameValid && _isLastNameValid && _isUsernameValid &&_isDobValid;
    });
  }

  // Define the reusable input field method within the class
  Padding _buildTextInput(String label, String hint,  TextEditingController controller, bool isValid) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(128, 224, 255, 1),
            ),
          ),
          TextField(
            controller: controller,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color.fromRGBO(128, 224, 255, 1),
                fontWeight: FontWeight.w300,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: isValid ? const Icon(Icons.check, color: Color.fromRGBO(203, 62, 249, 1),) : null
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(73, 96, 249, 1),
              Color.fromRGBO(25, 55, 254, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _image != null
                        ? FileImage(_image!) // Use selected image
                        : const AssetImage('assets/images/profile-image.png')
                            as ImageProvider, // Use default image
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 50),
                _buildTextInput('Username', 'Your username', _usernameController, _isUsernameValid),
                const SizedBox(height: 30),
                _buildTextInput('First Name', 'Your first name', _firstNameController, _isFirstNameValid),
                const SizedBox(height: 30),
                _buildTextInput('Last Name', 'Your last name', _lastNameController, _isLastNameValid),
                const SizedBox(height: 30),
                _buildTextInput('Date of Birth', 'Your birthday (dd-mm-yyyy)', _dobController, _isDobValid),
                const SizedBox(height: 70),
                Opacity(
                opacity: _isButtonEnabled ? 1.0 : 0.5, // Adjust opacity

                  child: ElevatedButton(
                    onPressed: () {
                      if (_isButtonEnabled) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ),
                        );
                      }else{
                        null;
                      }
                    },
                    style: ElevatedButton.styleFrom(fixedSize: const Size(350, 75)),
                    child: const Row(
                      children: [
                        Text(
                          '                       Complete',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(43, 71, 252, 1),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.check,
                          color: Color.fromRGBO(43, 71, 252, 1),
                        )
                      ],
                    ),
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
