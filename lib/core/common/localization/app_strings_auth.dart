// A class containing static string constants for authentication-related UI text.
class AppStringsAuth {
  // Headings
  static const String resetPasswordTitle = 'Reset Password';
  static const String screenTitle = 'Login to your account';
  static const String forgotPasswordHeading = 'Forgot Password';
  static const String welcomeBackHeading = 'Hello, Welcome Back\u{1F44B}';
  static const String welcomeHeading = 'Hello ,Welcome \u{1F44B}';
  static const String changePasswordHeading = 'Change Password';

  // Subtitles
  static const String resetPasswordSubtitle =
      'Just type your email and we will send a link to reset your password';
  static const String welcomeBackSubtitle = 'Happy to see you again. Please login here';
  static const String welcomeSubtitle = "First, let's create your account";
  static const String changePasswordSubtitle =
      "Congratulations, you have successfully validated your account, Now let's change the new password to use next time";
  static String forgotPasswordSubtitle(String email) =>
      'Enter 6 -digits code we sent you on email $email';

  // Labels & Buttons
  static const String login = 'Login';
  static const String register = 'Register';
  static const String username = 'Username';
  static const String email = 'Email';
  static const String emailAddress = 'Email Address';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot Password?';
  static const String resetPassword = 'Reset Password';
  static const String newPasswordLabel = 'Enter New Password';
  static const String repeatPasswordLabel = 'Repeat password';
  static const String changePassword = 'Change Password';
  static const String dontHaveAccount = "Don't have an account?";
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String orContinueWith = 'Or continue with';
  static const String rememberMe = 'Remember Me';
  static const String loginWithGoogle = 'Login with Google';
  static const String loginToYourAccount = 'Login to your account';
  static const String sendPasswordResetEmail = 'Send password reset email';
  static const String createAccount = 'Create Account';
  static const String termsOfService = 'Terms of Service';
  static const String privacyPolicy = 'Privacy Policy';
  static const String termsAndConditionsNotice = 'By signing up, you agree to our';
  static const String passwordRequirement = 'Min. 8 characters including numbers';
}
