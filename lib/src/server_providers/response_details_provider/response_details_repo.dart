import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/server_providers/response_details_provider/response_details_provider.dart';
import 'package:news_aggregator/src/utils/operation.dart';

class ResponseDetailsRepo {
  Future<Operation> fetchProvider(http.Client client, String id) async =>
      responseDetailsProvider.fetch(client, id);
}

final responseDetailsRepo = ResponseDetailsRepo();
