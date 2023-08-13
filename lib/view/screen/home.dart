import 'package:admin/core/constant/imageassets.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/view/widget/home/cardhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView(
        children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 150),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardAdminHome(
                onClick: () {
                  Get.toNamed(AppRoute.categoriesview);
                },
                title: "Categories",
                url: AppImageAsset.categories,
              ),
              CardAdminHome(
                onClick: () {
                  Get.toNamed(AppRoute.itemsview);
                },
                title: "Items",
                url: AppImageAsset.product,
              ),
              CardAdminHome(
                onClick: () {},
                title: "Users",
                url: AppImageAsset.users,
              ),
              CardAdminHome(
                onClick: () {},
                title: "Orders",
                url: AppImageAsset.orders,
              ),
              CardAdminHome(
                onClick: () {},
                title: "Report",
                url: AppImageAsset.report,
              ),
              CardAdminHome(
                onClick: () {},
                title: "Notification",
                url: AppImageAsset.notification2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
