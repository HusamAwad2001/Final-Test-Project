import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_test_project/logic/controllers/category_controller.dart';
import 'package:final_test_project/utils/theme.dart';
import 'package:final_test_project/view/widgets/category/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isCatgeoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.getCategoryIndex(index);
                    Get.to(
                      () => CategoryItems(
                        catehoryTitle: controller.categoryNameList[index],
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: controller.imageCategory[index],
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(color: mainColor),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              controller.categoryNameList[index],
                              style: const TextStyle(
                                backgroundColor: Colors.black38,
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: controller.categoryNameList.length,
            ),
          );
        }
      },
    );
  }
}
