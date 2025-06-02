import 'package:clutch_sports_app/firebase_options.dart';
import 'package:clutch_sports_app/screens/login_screen.dart';
import 'package:clutch_sports_app/screens/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //
  final prefs = await SharedPreferences.getInstance();
  final onBoardingVisited = prefs.getBool('onBoardingVisited') ?? false;
  runApp(MyApp(onBoardingVisited: onBoardingVisited));
}

class MyApp extends StatelessWidget {
  final bool onBoardingVisited;

  const MyApp({super.key, required this.onBoardingVisited});
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: 'Clutch',
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.grey[800], // or Colors.black if you prefer
          ),
        ),
      ),
      home: onBoardingVisited ? LoginScreen() : OnboardingScreen(),
    );
  }
}
