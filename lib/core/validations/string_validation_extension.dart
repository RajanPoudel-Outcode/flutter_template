extension StringValidation on String? {
  /// Email validation using regex pattern
  bool get isValidEmail {
    if (this == null || this!.isEmpty) return false;

    // Standard email regex pattern
    const String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final RegExp emailRegExp = RegExp(emailPattern);

    return emailRegExp.hasMatch(this!);
  }

  /// Validate email and return error message if invalid
  String? get emailValidationError {
    if (this == null || this!.isEmpty) {
      return 'Please enter your email';
    }

    if (!isValidEmail) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Password validation
  bool get isValidPassword {
    if (this == null || this!.isEmpty) return false;
    return this!.length >= 8;
  }

  /// Validate password and return error message if invalid
  String? get passwordValidationError {
    if (this == null || this!.isEmpty) {
      return 'Please enter your password';
    }

    if (this!.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }
}
