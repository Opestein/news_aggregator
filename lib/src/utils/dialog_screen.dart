import 'package:flutter/material.dart';
import 'package:news_aggregator/src/colors.dart';
import 'package:news_aggregator/src/utils/const.dart';

class DialogScreen extends StatefulWidget {
  final String title;
  final String message;
  final String buttonLabel;

  DialogScreen(this.title, this.message, this.buttonLabel);
  createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  var previousText = <String>[];
  var nextText = <String>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    var shortestSide = mediaQuery.size.shortestSide;
// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;

    //appTourBloc.initCheck(context);
    // TODO: implement build
    return Dialog(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(safeAreaWidth(context, 2)),
        width: useMobileLayout
            ? mediaQuery.size.width * 0.5
            : mediaQuery.size.width * 0.3,
        height: useMobileLayout
            ? mediaQuery.size.width * 0.5
            : mediaQuery.size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.title,
                style: TextStyle(
                    color: themeColor, fontSize: textFontSize(context, 14))),
            Divider(
              color: Colors.grey,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: textFontSize(context, 22)),
            ),
            Spacer(
              flex: 2,
            ),
            FlatButton(
              color: themeColor,
              child: new Text(
                widget.buttonLabel,
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
//                widget.onPop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
