import 'package:countries_graphql/api/job_api_client.dart';
import 'package:countries_graphql/bloc/countries_bloc.dart';
import 'package:countries_graphql/bloc/countries_event.dart';
import 'package:countries_graphql/ui/countries_page/countries_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp(jobsApiClient: JobsApiClient.create()));

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.jobsApiClient});

  final JobsApiClient jobsApiClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => JobsBloc(
          jobsApiClient: jobsApiClient,
        )..add(JobsFetchStarted()),
        child: const JobsPage(),
      ),
    );
  }
}
