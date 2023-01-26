import 'package:countries_graphql/ui/country_page/bloc/country_bloc.dart';
import 'package:countries_graphql/ui/country_page/bloc/country_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Country")),
      body: BlocConsumer<CountryBloc, CounrtyState>(
        builder: (context, state) {
          if (state is CounrtyLoadInProgress) {
            return const CircularProgressIndicator();
          }
          if (state is CounrtyLoadSuccess) {
            return Text(state.counrty.name);
          }
          return const Text('Oops something went wrong!');
        },
        listener: (context, state) {},
      ),
    );
  }
}
