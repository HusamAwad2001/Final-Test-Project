import 'package:final_test_project/logic/controllers/auth_controller.dart';
import 'package:final_test_project/logic/controllers/theme_controller.dart';
import 'package:final_test_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  // final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: GetBuilder<AuthController>(builder: (controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  'SettingsScreen',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white),
                ),
                onPressed: () {
                  ThemeController().changesTheme();
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white),
                ),
                onPressed: () {
                  Get.defaultDialog(
                    backgroundColor: Colors.grey,
                    title: 'Logout From App',
                    titleStyle: const TextStyle(color: Colors.black),
                    middleText: 'Are you sure you need to logout',
                    middleTextStyle: const TextStyle(color: Colors.black),
                    radius: 10,
                    textCancel: ' No ',
                    cancelTextColor: Colors.white,
                    textConfirm: ' Yes ',
                    confirmTextColor: Colors.white,
                    onCancel: () => Get.back(),
                    onConfirm: () => controller.signOutFromApp(),
                    buttonColor: Get.isDarkMode ? mainColor : pinkClr,
                    // barrierDismissible: false,
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
