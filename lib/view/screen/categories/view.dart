import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.categoriesadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CategoriesController>(
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
                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.network(
                              height: 80,
                              "${AppLink.imageCategories}/${controller.data[index].categoriesImage}",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(controller.data[index].categoriesName!),
                            subtitle: Text(
                                controller.data[index].categoriesDatetime!),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
                          ),
                        ),
                      ],
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
