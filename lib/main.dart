import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/app.dart';
import 'package:news_aggregator/src/app_config.dart';

void main() async {
  var client = http.Client();
  var configuredApp = AppConfig(
    child: NewsAggregatorApp(client),
  );
  runApp(configuredApp);
}
