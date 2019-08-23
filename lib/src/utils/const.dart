import 'package:flutter/material.dart';

double responsiveWidth(context, double width) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double blockHorizontal = _mediaQueryData.size.width / 100;
  double actualWidth = width * blockHorizontal;

  return actualWidth;
}

double responsiveHeight(context, double height) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double blockVertical = _mediaQueryData.size.height / 100;
  double actualHeight = height * blockVertical;

  return actualHeight;
}

double safeAreaWidth(context, double width) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double safeAreaHorizontal =
      _mediaQueryData.padding.left + _mediaQueryData.padding.right;

  double safeAreaBlockHorizontal =
      (_mediaQueryData.size.width - safeAreaHorizontal) / 100;
  double actualWidth = width * safeAreaBlockHorizontal;

  return actualWidth;
}

double safeAreaHeight(context, double height) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double safeAreaVertical =
      _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

  double safeAreaBlockVertical =
      (_mediaQueryData.size.height - safeAreaVertical) / 100;
  double actualHeight = height * safeAreaBlockVertical;

  return actualHeight;
}

double textFontSize(context, double size) {
  double _scaleFactor = MediaQuery.of(context).textScaleFactor;
  return (size) / _scaleFactor;
}



