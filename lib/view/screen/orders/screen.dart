import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/screen_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/orders/custombuttomappbarhome.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    //
    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text("Orders")),
        bottomNavigationBar: const CustomButtomAppBarHome(),
        body: WillPopScope(
          child: controller.listPage.elementAt(controller.currentpage),
          onWillPop: () {
            Get.defaultDialog(
                title: "WARNING",
                titleStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
                middleText: "Do You Want To Exit The App",
                cancelTextColor: AppColor.secondColor,
                confirmTextColor: AppColor.secondColor,
                buttonColor: AppColor.thirdColor,
                onCancel: () {},
                onConfirm: () {
                  exit(0);
                });
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
