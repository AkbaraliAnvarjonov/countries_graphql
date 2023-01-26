import 'package:countries_graphql/api/models/countries.dart';

abstract class CounrtyState {}

class CounrtyLoadInProgress extends CounrtyState {}

class CounrtyLoadSuccess extends CounrtyState {
  CounrtyLoadSuccess(this.counrty);

  final CountryModel counrty;
}

class CounrtyLoadFailure extends CounrtyState {}
