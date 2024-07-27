import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;

  //registration Method,
  Future<void> signUp({required email, required password}) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('This password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('This account already exists fot this email');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
