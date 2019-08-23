import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/server_providers/response_list_provider/response_list_provider.dart';
import 'package:news_aggregator/src/utils/operation.dart';

class ResponseListRepo {
  Future<Operation> fetchProvider(http.Client client) async =>
      responseListProvider.fetch(
        client,
      );
}

final responseListRepo = ResponseListRepo();
