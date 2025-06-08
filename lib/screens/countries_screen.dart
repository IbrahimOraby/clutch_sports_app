import 'package:clutch_sports_app/cubits/countries/countries_cubit.dart';
import 'package:clutch_sports_app/screens/leagues_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CountriesCubit>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountriesLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return ListTile(
                  leading: country.country_logo != null
                      ? Image.network(country.country_logo!, width: 40)
                      : Icon(Icons.flag),
                  title: Text(country.country_name ?? 'No Name'),
                  onTap: () {
                    // navigate to leagues screen
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LeaguesScreen()),
                    );
                  },
                );
              },
            );
          } else if (state is CountriesError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data yet.'));
          }
        },
      ),
    );
  }
}
