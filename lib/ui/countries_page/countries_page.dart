import 'package:countries_graphql/api/job_api_client.dart';
import 'package:countries_graphql/bloc/countries_bloc.dart';
import 'package:countries_graphql/bloc/countries_state.dart';
import 'package:countries_graphql/ui/country_page/bloc/country_bloc.dart';
import 'package:countries_graphql/ui/country_page/bloc/country_event.dart';
import 'package:countries_graphql/ui/country_page/country_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: Center(
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is JobsLoadInProgress) {
              return const CircularProgressIndicator();
            }
            if (state is JobsLoadSuccess) {
              return ListView.builder(
                itemCount: state.jobs.length,
                itemBuilder: (context, index) {
                  final job = state.jobs[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (_) => CountryBloc(
                                jobsApiClient: JobsApiClient.create(),
                              )..add(CountryFetchStarted(
                                  counrtyCode:
                                      state.jobs[index].code.toUpperCase())),
                              child: const CountryPage(),
                            ),
                          ));
                    },
                    key: Key(job.native),
                    leading: const Icon(Icons.location_city),
                    title: Text(job.name),
                    trailing: Text(job.emoji),
                    subtitle: Text(job.capital),
                  );
                },
              );
            }
            return const Text('Oops something went wrong!');
          },
        ),
      ),
    );
  }
}
