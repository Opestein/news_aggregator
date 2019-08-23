import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/ui/list_screen.dart';

class SplashHelper {
  BuildContext _context;
  http.Client _client;

  Future checkFirstScreen(http.Client client, BuildContext context) async {
    this._client = client;
    this._context = context;

    var _duration = new Duration(seconds: 4);

    Timer(_duration, navigationPage);
  }

  navigationPage() {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(
          builder: (context) => ListScreen(
                _client,
              )),
    );
  }
}
