// import 'package:flutter/material.dart';
//
// class SizeConfig {
//   static double? screenWidth;
//   static double? _screenHeight;
//   static double? _blockWidth = 0;
//   static double? _blockHeight = 0;
//
//   static double? _textMultiplier;
//   static double? imageSizeMultiplier;
//   static double? heightMultiplier;
//   static double? widthMultiplier;
//   static double? deviceRatio;
//   static bool isPortrait = true;
//   static bool isMobilePortrait = false;
//
//   static MediaQuery? _mediaQueryData;
//
//   void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context) as MediaQuery?;
//     screenWidth = _mediaQueryData!.data.size.width;
//     _screenHeight = _mediaQueryData!.data.size.height;
//
//     _blockWidth = screenWidth! / 100;
//     _blockHeight = _screenHeight! / 100;
//
//     _textMultiplier = _blockHeight;
//     imageSizeMultiplier = _blockWidth;
//     heightMultiplier = _blockHeight;
//     widthMultiplier = _blockWidth;
//     deviceRatio = screenWidth! / _screenHeight!;
//   }
//
//   static double scaleTextFont(double fontSize) {
//     double scale = fontSize / 8.96;
//     return (_textMultiplier! * scale);
//   }
//
//   static double scaleWidth(double width) {
//     double scale = width / 3.75;
//     return (widthMultiplier! * scale);
//   }
//
//   static double scaleHeight(double height) {
//     double scale = height / 8.12;
//     return (heightMultiplier! * scale);
//   }
// }
