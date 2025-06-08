import 'package:clutch_sports_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          icon: Image.asset(
            'assets/images/google_logo.png',
            height: 24,
            width: 24,
          ),
          label: const Text('Sign in with Google'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 3,
          ),
          onPressed: () async {
            final userCredential = await AuthServices().signInWithGoogle();
            //if sign is successful
            if (userCredential != null) {
              final user = AuthServices().currentUser;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Welcome ${user?.displayName ?? 'User'}!'),
                ),
              );
              //navigate to home screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );

              //if not
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Google Sign-In failed')),
              );
            }
          },
        ),
      ),
    );
  }
}
