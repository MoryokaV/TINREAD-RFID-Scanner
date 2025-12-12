import 'dart:async';
import 'package:flutter/widgets.dart';

class Responsive {
  Responsive._();

  static late MediaQueryData _mediaQueryData;

  static late double screenWidth;
  static late double screenHeight;

  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late double safePaddingTop;
  static late double safePaddingBottom;

  static late double pixelRatio;

  static final TextScaler textScalingNone = TextScaler.noScaling;
  static late TextScaler textScalingMd;

  static void getMediaQueryData() {
    _mediaQueryData = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    safeBlockHorizontal = (screenWidth - (_mediaQueryData.padding.left + _mediaQueryData.padding.right)) / 100;
    safeBlockVertical = (screenHeight - (_mediaQueryData.padding.top + _mediaQueryData.padding.bottom)) / 100;

    safePaddingTop = _mediaQueryData.padding.top;
    safePaddingBottom = _mediaQueryData.padding.bottom;

    pixelRatio = _mediaQueryData.devicePixelRatio;

    textScalingMd = _mediaQueryData.textScaler.clamp(minScaleFactor: 1.0, maxScaleFactor: 1.2);
  }

  static Future<void> init() async {
    getMediaQueryData();

    while (screenHeight == 0) {
      await Future.delayed(const Duration(milliseconds: 750), () => getMediaQueryData());
    }
  }
}
