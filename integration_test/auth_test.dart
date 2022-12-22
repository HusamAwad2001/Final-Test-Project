import 'package:final_test_project/main.dart' as app;
import 'package:final_test_project/utils/my_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("Auth Test", () {
    testWidgets("Auth Test", (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      ///------------------------ WELCOME SCREEN -----------------------------
      /// Action Button GetStarted
      await tester.tap(find.byKey(const Key(MyKeys.getStartedButton)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      ///------------------------ SIGN_UP SCREEN------------------------------
      /// Name
      await tester.enterText(find.byKey(const Key(MyKeys.signUpName)), "Husam");
      await tester.pumpAndSettle(const Duration(seconds: 1));

      /// Email
      await tester.enterText(
          find.byKey(const Key(MyKeys.signUpEmail)), "husam@gmail.com");
      await tester.pumpAndSettle(const Duration(seconds: 1));

      /// Password
      await tester.enterText(
          find.byKey(const Key(MyKeys.signUpPassword)), "123123");
      await tester.pumpAndSettle(const Duration(seconds: 1));

      /// Close Keyboard
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      /// Action Button
      await tester.tap(find.byKey(const Key(MyKeys.signUpChecked)));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      /// Action Button
      await tester.tap(find.byKey(const Key(MyKeys.signUpButton)));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      ///------------------------ SIGN_IN SCREEN -----------------------------
      /// Email
      await tester.enterText(
          find.byKey(const Key(MyKeys.signInEmail)), "husam@gmail.com");
      await tester.pumpAndSettle(const Duration(seconds: 1));

      /// Password
      await tester.enterText(
          find.byKey(const Key(MyKeys.signInPassword)), "123123");
      await tester.pumpAndSettle(const Duration(seconds: 1));

      /// Close Keyboard
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      /// Action Button
      await tester.tap(find.byKey(const Key(MyKeys.signInButton)));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      ///------------------------ HOME SCREEN------------------------------
      /// SEARCH TEXT-FIELD
      await tester.enterText(
          find.byKey(const Key(MyKeys.searchProductButton)), "j");
      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
  });
}
