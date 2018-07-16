class ValidationMixin {
  String validateEmail(String value) {  // function to the validator property
    // return null if valid
    // otherwise string (with error message) if invalid
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length  < 4) {
      return 'Password must be at least 4 characters';     
    }
  return null;
  }
}