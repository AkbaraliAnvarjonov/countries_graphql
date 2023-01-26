import 'package:countries_graphql/api/job_api_client.dart';
import 'package:countries_graphql/ui/country_page/bloc/country_event.dart';
import 'package:countries_graphql/ui/country_page/bloc/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<CountryEvent, CounrtyState> {
  CountryBloc({required JobsApiClient jobsApiClient})
      : _jobsApiClient = jobsApiClient,
        super(CounrtyLoadInProgress()) {
    on<CountryFetchStarted>(_onCounrtyFetchStarted);
  }

  final JobsApiClient _jobsApiClient;

  Future<void> _onCounrtyFetchStarted(
    CountryFetchStarted event,
    Emitter<CounrtyState> emit,
  ) async {
    emit(CounrtyLoadInProgress());
    try {
      final counrty = await _jobsApiClient.getSingleCountry(event.counrtyCode);
      emit(CounrtyLoadSuccess(counrty));
    } catch (error) {
      print("ERRROR:$error");
      emit(CounrtyLoadFailure());
    }
  }
}
