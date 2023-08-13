import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(title: const Text("Items")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.itemsadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ItemsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: () {
              return controller.myback();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.goToPageEdit(controller.data[index]);
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: CachedNetworkImage(
                                height: 80,
                                imageUrl:
                                    "${AppLink.imageItems}/${controller.data[index].itemsImage}",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text(controller.data[index].itemsName!),
                              subtitle: Text(controller.data[index].itemsDate!),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: "WARNING",
                                          middleText:
                                              "Do you confirm to deleate items",
                                          onCancel: () {},
                                          onConfirm: () {
                                            controller.deleteItems(
                                                controller.data[index].itemsId!,
                                                controller
                                                    .data[index].itemsImage!);
                                            Get.back();
                                          });
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                  // IconButton(
                                  //   onPressed: () {
                                  //     controller
                                  //         .goToPageEdit(controller.data[index]);
                                  //   },
                                  //   icon: const Icon(Icons.edit),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
