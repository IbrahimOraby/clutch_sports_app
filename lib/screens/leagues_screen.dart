import 'package:clutch_sports_app/cubits/leagues/leagues_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaguesScreen extends StatefulWidget {
  final int countryId;
  const LeaguesScreen({super.key, required this.countryId});

  @override
  State<LeaguesScreen> createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LeaguesCubit>().fetchLeagues(widget.countryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leagues')),
      body: BlocBuilder<LeaguesCubit, LeaguesState>(
        builder: (context, state) {
          if (state is LeaguesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LeaguesLoaded) {
            return ListView.builder(
              itemCount: state.leagues.length,
              itemBuilder: (context, index) {
                final league = state.leagues[index];
                return ListTile(
                  leading: league.league_logo != null
                      ? Image.network(league.league_logo!, width: 40)
                      : Icon(Icons.flag),
                  title: Text(league.league_name ?? 'No Name'),
                  onTap: () {
                    print('leagueesss');
                    // navigate to leagues screen
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         LeaguesScreen(countryId: country.country_key!),
                    //   ),
                    // );
                  },
                );
              },
            );
          } else if (state is LeaguesError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data yet.'));
          }
        },
      ),
    );
  }
}
