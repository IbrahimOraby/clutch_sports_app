import 'package:clutch_sports_app/cubits/teams/teams_cubit.dart';
import 'package:clutch_sports_app/screens/leagues_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamsScreen extends StatefulWidget {
  final int leagueId;

  const TeamsScreen({super.key, required this.leagueId});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TeamsCubit>().fetchTeams(widget.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teams')),
      body: BlocBuilder<TeamsCubit, TeamsState>(
        builder: (context, state) {
          if (state is TeamsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TeamsLoaded) {
            return ListView.builder(
              itemCount: state.teams.length,
              itemBuilder: (context, index) {
                final team = state.teams[index];
                return ListTile(
                  leading: team.teamLogo != null
                      ? Image.network(team.teamLogo!, width: 40)
                      : Icon(Icons.flag),
                  title: Text(team.teamName ?? 'No Name'),
                  onTap: () {
                    print('temsss');
                    // navigate to leagues screen
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         LeaguesScreen(teamId: team.teamKey!),
                    //   ),
                    // );
                  },
                );
              },
            );
          } else if (state is TeamsError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data yet.'));
          }
        },
      ),
    );
  }
}
