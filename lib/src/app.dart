import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/colors.dart';
import 'package:news_aggregator/src/provider/detail_model.dart';
import 'package:news_aggregator/src/provider/list_model.dart';
import 'package:news_aggregator/src/ui/splashscreen.dart';
import 'package:provider/provider.dart';

ThemeData _buildTheme() {
  ThemeData base = ThemeData.light();
  return base.copyWith(
    textSelectionColor: Colors.white,
    textTheme: _buildTextTheme(base.textTheme),
    appBarTheme: AppBarTheme(
        color: themeColor,
        textTheme: TextTheme(
            headline: TextStyle(color: white),
            body1: TextStyle(color: white),
            body2: TextStyle(color: white),
            subhead: TextStyle(color: white))),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    primaryIconTheme: base.primaryIconTheme.copyWith(
      color: Colors.white,
    ),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline
            .copyWith(fontWeight: FontWeight.w500, fontFamily: "CircularStd"),
        title: base.title.copyWith(fontSize: 18.0, fontFamily: "CircularStd"),
        caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            fontFamily: "CircularStd"),
      )
      .apply(bodyColor: Colors.black, fontFamily: "CircularStd");
}

class NewsAggregatorApp extends StatefulWidget {
  final http.Client client;
  NewsAggregatorApp(this.client);
  createState() => _NewsAggregatorAppState();
}

class _NewsAggregatorAppState extends State<NewsAggregatorApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListModel>(
          builder: (_) => ListModel(widget.client),
        ),
        ChangeNotifierProvider<DetailModel>(
          builder: (_) => DetailModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(),
        title: '',
        home: SplashScreen(
          widget.client,
        ),
      ),
    );
  }
}
