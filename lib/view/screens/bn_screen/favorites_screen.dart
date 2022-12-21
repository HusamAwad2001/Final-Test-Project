import 'package:final_test_project/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(
        () {
          if (controller.favouritesList.isEmpty) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/images/heart.png',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Please, Add you favorite products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemCount: controller.favouritesList.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                return buildFavItems(
                  productId: controller.favouritesList[index].id,
                  image: controller.favouritesList[index].image,
                  title: controller.favouritesList[index].title,
                  price: controller.favouritesList[index].price,
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget buildFavItems({
    required String image,
    required double price,
    required String title,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                controller.manageFavourites(productId);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
