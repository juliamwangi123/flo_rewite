String mapFirebaseAuthError(String code, String? message) {
  switch (code) {
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'user-disabled':
      return 'This user has been disabled.';
    case 'user-not-found':
      return 'No account found for this email.';
    case 'wrong-password':
      return 'Incorrect password. Please try again.';
    case 'email-already-in-use':
      return 'This email is already in use.';
    case 'weak-password':
      return 'The password is too weak. It must be at least 6 characters.';
    case 'operation-not-allowed':
      return 'This sign-in method is not allowed. Please contact support.';
    case 'invalid-credential':
      if (message != null &&
          message.toLowerCase().contains('no user record')) {
        return 'No account found for this email.';
      }
      return 'Invalid email or password.';
    default:
      return message ?? 'Something went wrong. Please try again.';
  }
}
