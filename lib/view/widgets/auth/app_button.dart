import 'package:final_test_project/utils/theme.dart';
import 'package:final_test_project/view/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Function() onPressed;

  AppButton({
    Key? key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
        minimumSize: const Size(360, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: AppText(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
