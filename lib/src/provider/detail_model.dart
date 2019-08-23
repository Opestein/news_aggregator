import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/model/response_details.dart';
import 'package:news_aggregator/src/server_providers/response_details_provider/response_details_repo.dart';
import 'package:news_aggregator/src/utils/ui_functions.dart';

typedef CompleteProcess();

class DetailModel with ChangeNotifier {
  DetailModel() {
//    fetchList(_client);
  }

  ItemDetails _itemDetails = ItemDetails();

  ItemDetails get itemDetails => _itemDetails;

  Future onItemClick(
    http.Client client,
    context,
    String id,
    CompleteProcess completeProcess,
  ) async {
    await responseDetailsRepo.fetchProvider(client, id).then((operation) {
      if (operation.code == 200) {
        _itemDetails = ItemDetails.fromJson(operation.result);
        print("itemDetail: " + itemDetails.toJson().toString());

        completeProcess();

        return true;
      } else {
        showDialogSingleButton(context, "error",
            operation.result['message'] ?? "An error occured", "OK");

        return true;
      }
    });
    notifyListeners();
  }
}
