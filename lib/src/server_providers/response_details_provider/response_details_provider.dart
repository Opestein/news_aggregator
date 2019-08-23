import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/server_providers/base_url.dart';
import 'package:news_aggregator/src/utils/operation.dart';

final authKey = "1eef55c635ad3bba47fcd645fd8929b170a08b33";

class ResponseDetailsProvider {
  Future<Operation> fetch(http.Client client, String id) async {
    final url = baseUrl + "object/$id";

    print(url);

    final response = await client.get(url, headers: {
      "Authorization": "Bearer $authKey",
      "Accept": "application/json",
      "Content-Type": "application/json"
    }).timeout(Duration(seconds: 120), onTimeout: () async {
      return http.Response(
          '{"message":"Connection Timed out. Please try again"}', 408);
    }).catchError((error) {
      return http.Response('{"message":"Error Connecting"}', 508);
    });

    print(response.body.toString());
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      return Operation(response.statusCode, responseJson);
    } else {
      final error = json.decode(response.body);

      print("error: " + error.toString());
      return Operation(response.statusCode, error);
    }
  }
}

final responseDetailsProvider = ResponseDetailsProvider();
