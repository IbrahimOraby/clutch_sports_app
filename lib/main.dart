import 'package:clutch_sports_app/cubits/leagues/leagues_cubit.dart';
import 'package:clutch_sports_app/cubits/teams/teams_cubit.dart';
import 'package:clutch_sports_app/data/repos/leagues_repo.dart';
import 'package:clutch_sports_app/data/repos/teams_repo.dart';
import 'package:clutch_sports_app/firebase_options.dart';
import 'package:clutch_sports_app/screens/home_screen.dart';
import 'package:clutch_sports_app/screens/login_screen.dart';
import 'package:clutch_sports_app/screens/onboarding.dart';
import 'package:clutch_sports_app/services/auth/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clutch_sports_app/cubits/countries/countries_cubit.dart';
import 'package:clutch_sports_app/data/repos/countries_repo.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //
  final prefs = await SharedPreferences.getInstance();
  final onBoardingVisited = prefs.getBool('onBoardingVisited') ?? false;
  //
  final currentUser = AuthServices().currentUser;
  final isUserLoggedIn = currentUser != null;

  runApp(
    MyApp(onBoardingVisited: onBoardingVisited, isUserLoggedIn: isUserLoggedIn),
  );
}

class MyApp extends StatelessWidget {
  final bool onBoardingVisited;
  final bool isUserLoggedIn;

  const MyApp({
    super.key,
    required this.onBoardingVisited,
    required this.isUserLoggedIn,
  });
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountriesCubit(CountriesRepo())),
        BlocProvider(create: (context) => LeaguesCubit(LeaguesRepo())),
        BlocProvider(create: (context) => TeamsCubit(TeamsRepo())),
      ],
      child: MaterialApp(
        title: 'Clutch',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
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
        home: onBoardingVisited
            ? (isUserLoggedIn ? const HomeScreen() : const LoginScreen())
            : const OnboardingScreen(),
      ),
    );
  }
}
