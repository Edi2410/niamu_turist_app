import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:niamu_project/core/di.dart';
import 'package:niamu_project/core/route_generator.dart';
import 'package:niamu_project/feature/auth/domain/usecase/auth_use_case.dart';
import 'package:niamu_project/feature/auth/presentation/controller/state/auth_state.dart';
import 'package:niamu_project/feature/common/presentation/utility/show_custom_alert_dialog.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final AuthUseCase _authUseCases;
  late User? currentUser;

  @override
  AuthState build() {
    _authUseCases = ref.watch(authUseCasesProvider);
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser == null
        ? const UnauthenticatedAuthState(fromSignIn: false)
        : AuthenticatedAuth(currentUser);
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    state = const LoadingAuth();
    final result = await _authUseCases.signIn(email, password);
    result.fold(
      (error) {
        state = UnauthenticatedAuthState(error: error, fromSignIn: true);
        currentUser = null;
        if (context.mounted) {
          showCustomAlertDialog(context, error.toString());
        }
      },
      (user) {
        state = AuthenticatedAuth(user!);
        currentUser = user;
        Navigator.of(context).pushNamed(RouteGenerator.homePageScreen);
      },
    );
  }

  Future<void> signUp(
      BuildContext context, String email, String password) async {
    state = const LoadingAuth();
    final result = await _authUseCases.signUp(email, password);
    result.fold(
      (error) {
        if (context.mounted) {
          showCustomAlertDialog(context, error.toString());
        }
        state = UnauthenticatedAuthState(error: error, fromSignIn: false);
        currentUser = null;
      },
      (user) {
        state = AuthenticatedAuth(user!);
        currentUser = user;
        currentUser!.sendEmailVerification();
        Navigator.of(context).pushNamed(RouteGenerator.verifyEmailScreen,
            arguments: ModalRoute.of(context)?.settings.name);
      },
    );
  }

  Future<void> resetPassword(BuildContext context, final String email) async {
    final results = await _authUseCases.resetPassword(email);
    results.fold(
      (error) {
        if (context.mounted) {
          showCustomAlertDialog(context, error.toString());
        }
      },
      (_) {
        Navigator.of(context).pushNamed(RouteGenerator.verifyEmailScreen,
            arguments: ModalRoute.of(context)?.settings.name);
      },
    );
  }

  Future<void> signOut(BuildContext context) async {
    final results = await _authUseCases.signOutUser();
    results.fold((error) {
      if (context.mounted) {
        showCustomAlertDialog(context, error.toString());
      }
    }, (_) {
      state = const UnauthenticatedAuthState(fromSignIn: false);
      currentUser = null;
      Navigator.of(context).pushNamed(RouteGenerator.signInScreen);
    });
  }

  Future<void> resendVerificationEmail() async =>
      await _authUseCases.resendVerificationEmail();

  Future<void> deleteUser(BuildContext context) async {
    final results = await _authUseCases.deleteUser();

    results.fold((error) {
      if (context.mounted) {
        showCustomAlertDialog(context, error.toString());
      }
    }, (_) {
      state = const UnauthenticatedAuthState(fromSignIn: false);
      Navigator.of(context).pushNamed(RouteGenerator.signInScreen);
    });
  }
}
