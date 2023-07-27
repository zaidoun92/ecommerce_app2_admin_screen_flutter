import 'package:admin/controller/orders/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/custombuttonappbar.dart';

class CustomButtomAppBarHome extends StatelessWidget {
  const CustomButtomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.listPage.length,
              ((index) {
                return Expanded(
                  child: CustomButtonAppBar(
                    textbutton: controller.bottomappbar[index]['title'],
                    icondata: controller.bottomappbar[index]['icon'],
                    onPressed: () {
                      controller.changePage(index);
                    },
                    active: controller.currentpage == index ? true : false,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
