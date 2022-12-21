import 'package:final_test_project/view/screens/category_screen.dart';
import 'package:final_test_project/view/screens/favorites_screen.dart';
import 'package:final_test_project/view/screens/home_screen.dart';
import 'package:final_test_project/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    FavoritesScreen(),
    const SettingsScreen(),
  ].obs;

  var title = [
    "Husam Shop",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;
}
