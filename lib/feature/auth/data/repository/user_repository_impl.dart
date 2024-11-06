import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:niamu_project/core/error/failure.dart';
import 'package:niamu_project/feature/auth/data/firabase/user_firebase_api.dart';
import 'package:niamu_project/feature/auth/domain/repository/user_repository'
    '.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFirebaseApi _api;

  const UserRepositoryImpl(this._api);

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      final result = await _api.resetPassword(email);

      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }

  }

  @override
  Future<Either<Failure, User?>> signInUser(String email, String password) async {
    try {
      final result = await _api.signInUser(email, password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> signUpUser(String email, String password) async {

    try {
      final result = await _api.signUpUser(email, password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resendVerificationEmail() async {
    try{
      final result = _api.resendVerificationEmail();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOutUser()async {
    try {
      final result = _api.signOut();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try {
      final result = _api.deleteUser();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }
}