import 'package:final_test_project/logic/controllers/auth_controller.dart';
import 'package:final_test_project/utils/theme.dart';
import 'package:final_test_project/view/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCheck extends StatelessWidget {
  AppCheck({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () => controller.checkBox(),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                      ? Image.asset('assets/images/check.png')
                      : const Icon(
                          Icons.done,
                          size: 30,
                          color: pinkClr,
                        )
                  : Container(),
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              AppText(
                text: 'I accept ',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                textColor: Get.isDarkMode ? Colors.black : Colors.white,
              ),
              AppText(
                text: 'terms & conditions',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                textColor: Get.isDarkMode ? Colors.black : Colors.white,
                textDecoration: TextDecoration.underline,
              ),
            ],
          )
        ],
      );
    });
  }
}
