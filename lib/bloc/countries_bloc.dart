import 'package:countries_graphql/api/job_api_client.dart';
import 'package:countries_graphql/bloc/countries_event.dart';
import 'package:countries_graphql/bloc/countries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc({required JobsApiClient jobsApiClient})
      : _jobsApiClient = jobsApiClient,
        super(JobsLoadInProgress()) {
    on<JobsFetchStarted>(_onJobsFetchStarted);
  }

  final JobsApiClient _jobsApiClient;

  Future<void> _onJobsFetchStarted(
    JobsFetchStarted event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsLoadInProgress());
    try {
      final jobs = await _jobsApiClient.getCountries();
      emit(JobsLoadSuccess(jobs));
    } catch (error) {
      print("ERRROR:$error");
      emit(JobsLoadFailure());
    }
  }
}
