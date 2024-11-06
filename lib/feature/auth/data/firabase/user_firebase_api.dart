import 'package:firebase_auth/firebase_auth.dart';

class UserFirebaseApi {
  final FirebaseAuth instance;

  const UserFirebaseApi(this.instance);

  Future<User?> signInUser(final String email, final String password) async {
    final credential = await instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );


    return credential.user;

  }

  Future<User?> signUpUser(final String email, final String password) async {
    final credential = await instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  Future<void> resetPassword(final String email) => instance.sendPasswordResetEmail(email: email);

  Future<void> signOut() => instance.signOut();

  Future<void> deleteUser() => instance.currentUser!.delete();

  Future<void> resendVerificationEmail() => instance.currentUser!.sendEmailVerification();
}