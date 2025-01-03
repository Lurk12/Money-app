class UserModel {
  String email;
  String password;

  UserModel({required this.email, required this.password});

  bool isPasswordValid() {
    // Check if the password contains at least one letter and one number
    final RegExp hasLetter = RegExp(r'[a-zA-Z]');
    final RegExp hasDigit = RegExp(r'[0-9]');

    return hasLetter.hasMatch(password) || hasDigit.hasMatch(password);
  }
   bool isValidEmail() {
    // Define a regular expression for validating an email
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    // Check if the email matches the regular expression
    return emailRegExp.hasMatch(email);
  }
}

