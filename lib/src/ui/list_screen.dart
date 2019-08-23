import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:news_aggregator/src/colors.dart';
import 'package:news_aggregator/src/provider/detail_model.dart';
import 'package:news_aggregator/src/provider/list_model.dart';
import 'package:news_aggregator/src/ui/detail_screen.dart';
import 'package:news_aggregator/src/utils/assets.dart';
import 'package:news_aggregator/src/utils/const.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  final http.Client client;

  ListScreen(this.client);

  @override
  State createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  bool isLoading = false;

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

    var data = Provider.of<ListModel>(context, listen: false).responseList;
    var dataDetails = Provider.of<DetailModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                null,
              ),
              onPressed: null,
            ),
            title: Center(
                child: Text(
              "List",
              style:
                  TextStyle(fontSize: textFontSize(context, 18), color: white),
            )),
            actions: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: responsiveWidth(context, 0)),
                  width: safeAreaWidth(context, 13),
                ),
              ),
            ],
          ),
          body: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    color: themeColor,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(safeAreaWidth(context, 4)),
                          child: SizedBox(
                              child:
//                        Consumer<ListModel>(
//                            builder: (context, list, child) {
//                          var data = list.responseList;
                                  (data != null)
                                      ? GridView.builder(
                                          itemCount: data.listItem.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 20,
                                            childAspectRatio:
                                                (mediaQuery.size.width / 2) /
                                                    ((mediaQuery.size.width +
                                                            (mediaQuery.size
                                                                    .width) *
                                                                0.65) /
                                                        2),
                                          ),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                dataDetails
                                                    .onItemClick(
                                                        widget.client,
                                                        context,
                                                        data.listItem
                                                            .elementAt(index)
                                                            .id
                                                            .toString(),
                                                        navigator)
                                                    .then((data) {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                });
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Hero(
                                                    tag: data.listItem
                                                        .elementAt(index)
                                                        .id
                                                        .toString(),
                                                    child: FadeInImage(
                                                      placeholder: AssetImage(
                                                          Assets.logo_sig),
                                                      image: MemoryImage(
                                                        base64.decode(
                                                          data.listItem
                                                              .elementAt(index)
                                                              .image,
                                                        ),
                                                      ),
                                                      height: (mediaQuery
                                                                  .size.width +
                                                              (mediaQuery.size
                                                                      .width) *
                                                                  0.1) /
                                                          2,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: safeAreaWidth(
                                                            context, 3.7),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                            data.listItem
                                                                .elementAt(
                                                                    index)
                                                                .title,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    textFontSize(
                                                                        context,
                                                                        16),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: white)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                      : Center(
                                          child: Container(
                                          color: themeColor,
                                          height: double.infinity,
                                          child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      white)),
                                        ))

//                        }),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              isLoading
                  ? Container(
                      color: Colors.black54.withOpacity(0.2),
                      child: Center(
                        child: Container(
                          height: safeAreaHeight(context, 20),
                          width: safeAreaWidth(context, 55),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      themeColor)),
                              SizedBox(
                                height: safeAreaHeight(context, 1),
                              ),
                              Text(
                                "Getting details...",
                                style: TextStyle(
                                    fontSize: textFontSize(context, 13)),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          )),
    );
  }

  navigator() => Navigator.push(
      context, CupertinoPageRoute(builder: (context) => DetailScreen()));
}
