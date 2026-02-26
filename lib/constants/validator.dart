String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter Password';
  }
  // if (value.length < 8) {
  //   return 'Password must be at least 8 characters';
  // }
  return null;
}

// Confirm Password Validator
String? confirmPasswordValidator(String? value, String? originalPassword) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != originalPassword) {
    return 'Passwords do not match';
  }
  return null;
}

// Validate original Bangladeshi phone number
String? validateBDPhoneNumber(String? value) {
  String pattern = r'^(?:\+?88)?01[3-9]\d{8}$';
  RegExp regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return 'Please enter a phone number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid Bangladeshi phone number';
  }
  return null;
}

// Confirm phone number matches the original
String? confirmPhoneNumber(String? value, String? originalNumber) {
  String pattern = r'^(?:\+?88)?01[3-9]\d{8}$';
  RegExp regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return 'Please retype your phone number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid Bangladeshi phone number';
  } else if (value != originalNumber) {
    return 'Phone numbers do not match';
  }
  return null;
}

//validation Name
String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }

  return null;
}

//validation Name
String? messageValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your Message';
  }
  return null;
}

//validation Name
String? searchValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please input something';
  }
  return null;
}

//validation Name
String? ammountValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter ammount';
  }
  return null;
}
