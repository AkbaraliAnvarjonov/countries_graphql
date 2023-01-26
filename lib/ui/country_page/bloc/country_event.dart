abstract class CountryEvent {}

class CountryFetchStarted extends CountryEvent {
  String counrtyCode;
  CountryFetchStarted({required this.counrtyCode});
}
