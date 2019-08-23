import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/model/response_list.dart';
import 'package:news_aggregator/src/server_providers/response_details_provider/response_details_repo.dart';
import 'package:news_aggregator/src/server_providers/response_list_provider/response_list_repo.dart';
import 'package:news_aggregator/src/utils/ui_functions.dart';

typedef CompleteProcess();

class ListModel with ChangeNotifier {
  http.Client _client;

  ListModel(this._client) {
    fetchList(_client);
  }


  ResponseList _responseList;


  ResponseList get responseList => _responseList;

  void fetchList(
    http.Client client,
  ) {

    this._client = client;
    responseListRepo.fetchProvider(_client).then((operation) {
      if (operation.code == 200) {
        _responseList = ResponseList.fromJson(operation.result);
        print(_responseList.listItem.elementAt(0).toJson().toString());
      }
    });
    notifyListeners();
  }

}
