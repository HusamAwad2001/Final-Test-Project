import 'package:final_test_project/logic/controllers/auth_controller.dart';
import 'package:final_test_project/logic/controllers/cart_controller.dart';
import 'package:final_test_project/logic/controllers/category_controller.dart';
import 'package:final_test_project/models/product_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  AuthController authController = Get.put(AuthController());
  CategoryController categoryController = Get.put(CategoryController());
  CartController cartController = Get.put(CartController());
  const name = 'Husam Dahliz';
  const email = 'dev.husam@gmail.com';
  const password = 'password';
  Rating rating = Rating(rate: 4.5, count: 5);
  ProductModels productModel = ProductModels(
    id: 1,
    title: 'Title product',
    price: 100,
    description: 'This is the description',
    category: Category.ELECTRONICS,
    image: 'image_path',
    rating: rating,
  );

  /// UNIT-TEST (1)
  test('signUpUsingFirebase test', () async {
    try {
      await authController.signUpUsingFirebase(
        name: name,
        email: email,
        password: password,
      );
    } catch (error) {
      expect(error.toString(), 'Exception: error signUpUsingFirebase');
    }
  });

  /// UNIT-TEST (2)
  test('signInUsingFirebase test', () async {
    try {
      await authController.logInUsingFirebase(
        email: email,
        password: password,
      );
    } catch (error) {
      expect(error.toString(), 'Exception: error signInUsingFirebase');
    }
  });

  /// UNIT-TEST (3)
  test('getCategories test', () async {
    try {
      await categoryController.getCategories();
    } catch (error) {
      expect(error.toString(), 'Exception: error getCategories');
    }
  });

  /// UNIT-TEST (4)
  test('addProductToCart test', () async {
    try {
      await cartController.addProductToCart(productModel);
    } catch (error) {
      expect(error.toString(), 'Exception: error addProductToCart');
    }
  });

  /// UNIT-TEST (5)
  test('removeProductsFarmCart test', () async {
    try {
      await cartController.removeProductsFarmCart(productModel);
    } catch (error) {
      expect(error.toString(), 'Exception: error removeProductsFarmCart');
    }
  });

  /// UNIT-TEST (6)
  test('removeOneProduct test', () async {
    try {
      await cartController.removeOneProduct(productModel);
    } catch (error) {
      expect(error.toString(), 'Exception: error removeOneProduct');
    }
  });

  /// UNIT-TEST (7)
  test('clearAllProducts test', () async {
    try {
      await cartController.clearAllProducts();
    } catch (error) {
      expect(error.toString(), 'Exception: error clearAllProducts');
    }
  });
}
