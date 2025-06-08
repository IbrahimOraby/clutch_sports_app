import 'package:clutch_sports_app/cubits/topscorers/topscorers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopscorersScreen extends StatefulWidget {
  final int leagueId;

  const TopscorersScreen({super.key, required this.leagueId});

  @override
  State<TopscorersScreen> createState() => _TopscorersScreenState();
}

class _TopscorersScreenState extends State<TopscorersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TopscorersCubit>().fetchTopscorers(widget.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Teams')),
      body: BlocBuilder<TopscorersCubit, TopscorersState>(
        builder: (context, state) {
          if (state is TopscorersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopscorersLoaded) {
            return ListView.builder(
              itemCount: state.topscorers.length,
              itemBuilder: (context, index) {
                final topscorer = state.topscorers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: Icon(Icons.person, color: Color(0xFF3674B5)),
                  ),
                  title: Text(topscorer.playerName ?? 'No Name'),
                  subtitle: Text(topscorer.goals.toString()),
                );
              },
            );
          } else if (state is TopscorersError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data yet.'));
          }
        },
      ),
    );
  }
}
