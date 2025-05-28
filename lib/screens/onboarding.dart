import 'package:clutch_sports_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  // to make the auto slider
  late Timer _timer;
  int _currentPage = 0;
  final int _totalPages = 3;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _totalPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //swipeable pages
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _currentPage = index;
            },
            children: [
              _buildOnboardingPage(
                context,
                image: 'assets/images/onboarding-1.png',
                title: 'All Your Favorite Teams in One Place',
                description:
                    'Follow matches, leagues, and players from around the world.',
              ),
              _buildOnboardingPage(
                context,
                image: 'assets/images/onboarding-2.png',
                title: 'Browse by Country & League',
                description:
                    'Choose your favorite teams, countries, or leagues to follow.',
              ),
              _buildOnboardingPage(
                context,
                image: 'assets/images/onboarding-3.png',
                title: 'Discover Teams Around the Globe',
                description:
                    'Explore leagues from Europe to South America. Dive into team stats, match schedules, and more.',
              ),
            ],
          ),

          //SKIP
          Positioned(
            top: kToolbarHeight,
            right: 24,
            child: TextButton(
              onPressed: () async {
                //set onBoardingVisited to true
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('onBoardingVisited', true);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text(
                'SKIP',
                style: TextStyle(color: Color(0xFF578FCA)),
              ),
            ),
          ),

          //indicator
          Positioned(
            bottom: kBottomNavigationBarHeight + 25,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xFF578FCA),
                  dotHeight: 6,
                ),
                count: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(
    BuildContext context, {
    required String image,
    required String title,
    required String description,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image
          SizedBox(
            height: screenHeight * 0.3,
            child: Center(
              child: Image.asset(
                image,
                width: MediaQuery.sizeOf(context).width * 0.8,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 24),
          // title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 12),
          // description
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
