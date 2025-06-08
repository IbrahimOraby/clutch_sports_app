import 'package:clutch_sports_app/screens/topscorers_screen.dart';
import 'package:flutter/material.dart';
import 'teams_screen.dart';

class LeagueDetailsScreen extends StatelessWidget {
  final int leagueId;

  const LeagueDetailsScreen({super.key, required this.leagueId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('League Details'),
          bottom: const TabBar(
            indicatorColor: Color(0xFF3674B5),
            labelColor: Color(0xFF3674B5),
            tabs: [
              Tab(text: 'Teams'),
              Tab(text: 'Top Scorers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TeamsScreen(leagueId: leagueId),
            TopscorersScreen(leagueId: leagueId),
          ],
        ),
      ),
    );
  }
}
