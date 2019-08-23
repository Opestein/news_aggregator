import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:news_aggregator/src/colors.dart';
import 'package:news_aggregator/src/provider/detail_model.dart';
import 'package:news_aggregator/src/utils/assets.dart';
import 'package:news_aggregator/src/utils/const.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  @override
  State createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor:
            Colors.black //or set color with: Color(0xFF0000FF)
        ));

    MediaQueryData mediaQuery = MediaQuery.of(context);

    var data = Provider.of<DetailModel>(context, listen: false).itemDetails;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_backspace,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Center(
                child: Text(
              "Detail",
              style:
                  TextStyle(fontSize: textFontSize(context, 18), color: white),
            )),
            actions: <Widget>[
              GestureDetector(
                onTap: null,
                child: Container(
                  margin: EdgeInsets.only(right: responsiveWidth(context, 0)),
                  width: safeAreaWidth(context, 13),
                ),
              ),
            ],
          ),
          body: Container(
            color: Color(0xFF282B3D),
            height: double.infinity,
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        height: safeAreaHeight(context, 55),
                        child: GridTile(
                          child: Hero(
                            tag: data.id.toString(),
                            child: FadeInImage(
                              placeholder: AssetImage(Assets.logo_sig),
                              image: MemoryImage(
                                base64.decode(data.image),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: safeAreaHeight(context, 1.7),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: safeAreaWidth(context, 5), vertical: 24),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                                text: TextSpan(
                                    text: DateFormat('MMM dd, yyyy ')
                                            .format(data.created_at) +
                                        "at ",
                                    style: TextStyle(
                                        fontSize: textFontSize(context, 16),
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white30),
                                    children: <TextSpan>[
                                  TextSpan(
                                    text: DateFormat('hh:mm a')
                                        .format(data.created_at),
                                    style: TextStyle(
                                        fontSize: safeAreaHeight(context, 2),
                                        fontWeight: FontWeight.w600,
                                        color: white),
                                  )
                                ])),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            data.title,
                            style: TextStyle(
                                fontSize: textFontSize(context, 24),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                height: 1.2,
                                color: white),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            data.description,
                            style: TextStyle(
                                fontSize: textFontSize(context, 19),
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
