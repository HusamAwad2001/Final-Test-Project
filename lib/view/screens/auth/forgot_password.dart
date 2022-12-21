import 'package:final_test_project/logic/controllers/auth_controller.dart';
import 'package:final_test_project/utils/my_string.dart';
import 'package:final_test_project/utils/theme.dart';
import 'package:final_test_project/view/widgets/auth/app_button.dart';
import 'package:final_test_project/view/widgets/auth/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? mainColor : pinkClr,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'If you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(height: 50),
                  AppTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Image.asset('assets/images/email.png')
                        : const Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          ),
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 50),
                  GetBuilder<AuthController>(builder: (_) {
                    return AppButton(
                      text: 'SEND',
                      onPressed: () {
                        controller.resetPassword(_emailController.text);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
