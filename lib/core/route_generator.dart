import 'package:flutter/material.dart';
import 'package:niamu_project/feature/auth/presentation/screen/confirm_email_screen.dart';
import 'package:niamu_project/feature/auth/presentation/screen/reset_password_screen.dart';
import 'package:niamu_project/feature/auth/presentation/screen/sign_in_screen.dart';
import 'package:niamu_project/feature/auth/presentation/screen/sign_up_screen.dart';
import 'package:niamu_project/feature/common/presentation/screen/splash_screen.dart';
import 'package:niamu_project/feature/common/presentation/screen/home_page_screen.dart';

class RouteGenerator {
  static const splashScreen = '/';
  static const signInScreen = '/signIn';
  static const signUpScreen = '/signUp';
  static const resetPasswordScreen = '/resetPassword';
  static const verifyEmailScreen = '/verifyEmail';
  static const homePageScreen = '/homePage';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
      case signInScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignInScreen());
      case signUpScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignUpScreen());
      case resetPasswordScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ResetPasswordScreen());
      case homePageScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePageScreen());
      case verifyEmailScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const VerifyEmailScreen(),
        );

      default:
        throw Exception('Route not found...');
    }
  }
}
