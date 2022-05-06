import 'package:firebase_auth/firebase_auth.dart';
import 'package:ebook_app/models/auth_user.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanged => _firebaseAuth.idTokenChanges();

  Future<AuthUser?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      return AuthUser.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<AuthUser?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      return AuthUser.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<AuthUser?> get getCurrentUser {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => user != null ? AuthUser.fromFirebase(user) : null);
  }
}
