import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/helper/splash_helper.dart';
import 'package:news_aggregator/src/utils/assets.dart';

class SplashScreen extends StatefulWidget {
  final http.Client client;

  SplashScreen(
    this.client,
  );

  @override
  State createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin, SplashHelper {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });

    checkFirstScreen(
      widget.client,
      context,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor:
            Colors.white //or set color with: Color(0xFF0000FF)
        ));

    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Image.asset(Assets.logo_sig),
          ),
        ),
      ),
    );
  }
}
