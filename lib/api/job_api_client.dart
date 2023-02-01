import 'package:countries_graphql/api/models/countries.dart';
import 'package:graphql/client.dart';

class GetJobsRequestFailure implements Exception {}

class JobsApiClient {
  const JobsApiClient({required GraphQLClient graphQLClient})
      : _graphQLClient = graphQLClient;

  factory JobsApiClient.create() {
    final httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([httpLink]);
    return JobsApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<List<CountryModel>> getCountries() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(''' query GetCountries() {
    countries {
    name
    native
    capital
    emoji
    currency
    code    
    }
  }''')),
    );
    if (result.hasException) throw GetJobsRequestFailure();
    final data = result.data?['countries'] as List;
    return data
        .map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<CountryModel> getSingleCountry(String countryCode) async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(''' query GetCountry() {
   
    country(code: "$countryCode") {
    name
    native
    capital
    emoji
    currency
    code    
}
  }''')),
    );
    if (result.hasException) throw GetJobsRequestFailure();
    final data = result.data?['country'];
    print("SUCCESS DATA:${result.data.toString()}");
    return data;
  }
}
