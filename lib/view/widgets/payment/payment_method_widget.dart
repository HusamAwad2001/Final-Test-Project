import 'package:final_test_project/logic/controllers/auth_controller.dart';
import 'package:final_test_project/logic/controllers/cart_controller.dart';
import 'package:final_test_project/logic/controllers/payment_controller.dart';
import 'package:final_test_project/utils/theme.dart';
import 'package:final_test_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  final payMentController = Get.find<PayMentController>();
  final cartController = Get.find<CartController>();
  final authController = Get.find<AuthController>();
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          GetBuilder<PayMentController>(
            builder: (_) => buildRadioPayment(
              name: "Paypal",
              image: 'assets/images/paypal.png',
              scale: 0.7,
              value: 1,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                payMentController.removeGooglePay();
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PayMentController>(
            builder: (_) => buildRadioPayment(
              name: "Google Pay",
              image: 'assets/images/google.png',
              scale: 0.8,
              value: 2,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                payMentController.makeGooglePay(
                  amount: cartController.total.toString(),
                  label: authController.displayUserName.value,
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PayMentController>(
            builder: (_) => buildRadioPayment(
              name: "Credit Card",
              image: 'assets/images/credit.png',
              scale: 0.7,
              value: 3,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                payMentController.removeGooglePay();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: name,
                color: Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
