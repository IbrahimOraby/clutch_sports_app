import 'package:clutch_sports_app/screens/countries_screen.dart';
import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleSportTap(BuildContext context, String sportName) {
    if (sportName == 'Football') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const CountriesScreen()));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Coming Soon'),
          content: Text('$sportName content is coming soon!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: sports.map((sport) {
            return GestureDetector(
              onTap: () => _handleSportTap(context, sport['name']!),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(sport['image']!, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sport['name']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
