import 'package:flutter/material.dart';
import 'package:sketch/core/utils/size_config.dart';

abstract class AppStyles {
  static TextStyle styleRegular16(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle styleRegular10(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  static TextStyle styleRegular18(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  static TextStyle styleBold22(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 22),
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
