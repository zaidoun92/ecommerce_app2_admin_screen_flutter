import 'package:admin/core/constant/imageassets.dart';
import 'package:admin/view/widget/home/cardhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
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
                onClick: () {},
                title: "Notification",
                url: AppImageAsset.notification2,
              ),
              CardAdminHome(
                onClick: () {},
                title: "Product",
                url: AppImageAsset.product,
              ),
              CardAdminHome(
                onClick: () {},
                title: "Orders",
                url: AppImageAsset.orders,
              ),
              CardAdminHome(
                onClick: () {},
                title: "Massage",
                url: AppImageAsset.message,
              ),
              CardAdminHome(
                onClick: () {},
                title: "Report",
                url: AppImageAsset.report,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
