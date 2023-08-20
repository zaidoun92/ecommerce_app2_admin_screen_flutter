import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/screen_controller.dart';
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
        body: controller.listPage.elementAt(controller.currentpage),
      ),
    );
  }
}
