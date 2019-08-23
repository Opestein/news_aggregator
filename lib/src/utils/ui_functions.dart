import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_aggregator/src/colors.dart';
import 'package:news_aggregator/src/utils/const.dart';
import 'package:news_aggregator/src/utils/dialog_screen.dart';



void showDialogSingleButton(
    BuildContext context, String title, String message, String buttonLabel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DialogScreen(
        title,
        message,
        buttonLabel,
      );
    },
  );
}

