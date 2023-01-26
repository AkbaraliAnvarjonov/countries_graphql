import 'package:countries_graphql/api/models/countries.dart';

abstract class JobsState {}

class JobsLoadInProgress extends JobsState {}

class JobsLoadSuccess extends JobsState {
  JobsLoadSuccess(this.jobs);

  final List<CountryModel> jobs;
}

class JobsLoadFailure extends JobsState {}
