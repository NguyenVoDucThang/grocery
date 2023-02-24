class Validator {
  static String? validateNameForm(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid value';
    } else if (value.length <= 2) {
      return 'Name is too short';
    }

    return null;
  }

  static String? validateEmailForm(String? value) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value ?? '');

    if (value == null || value.isEmpty) {
      return 'Invalid value';
    } else if (value.length <= 2) {
      return 'Email is too short';
    } else if (!emailValid) {
      return 'Email isn\'t correct';
    }

    return null;
  }

  static String? validatePasswordForm(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid value';
    } else if (value.length <= 6) {
      return 'Password is too short';
    }

    return null;
  }

  static String? validateConfirmPasswordForm(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Invalid value';
    } else if (confirmPassword.length <= 6) {
      return 'Confirm password is too short';
    }

    return null;
  }
}
