import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {


  AppConfig({

    Widget child,
  }) : super(child: child);

  static AppConfig of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(AppConfig);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
