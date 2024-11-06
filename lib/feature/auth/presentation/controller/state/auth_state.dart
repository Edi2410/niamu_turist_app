
import 'package:firebase_auth/firebase_auth.dart';
import 'package:niamu_project/core/error/failure.dart';

sealed class AuthState {
  const AuthState();
}

class LoadingAuth extends AuthState {
  const LoadingAuth();
}

class UnauthenticatedAuthState extends AuthState {
  final Failure? error;
  final bool fromSignIn;

  const UnauthenticatedAuthState({this.error, required this.fromSignIn});
}

class AuthenticatedAuth extends AuthState {
  final User user;

  const AuthenticatedAuth(this.user);
}