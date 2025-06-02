import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      //begin interactive sign in process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      //user canceled
      if (googleUser == null) return null;

      //obtain auth details from request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      //create new credentials
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      //sign in
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Google sign-in error: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Auth state changes (e.g., listen to sign-in or sign-out)
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
