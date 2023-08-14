import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/items/edit_controller.dart';
import '../../../core/shared/customdropdownsearch.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ItemsEditController controller = Get.put(ItemsEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Items"),
      ),
      body: GetBuilder<ItemsEditController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    hintText: "Add the Item",
                    labelText: "Item name",
                    iconData: Icons.category,
                    myController: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isNumbner: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "Add the Item (Arabic)",
                    labelText: "Item name (Arabic)",
                    iconData: Icons.category,
                    myController: controller.namear,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isNumbner: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "item Description",
                    labelText: "Item Description",
                    iconData: Icons.category,
                    myController: controller.desc,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isNumbner: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "Item Description (Arabic)",
                    labelText: "Item Description (Arabic)",
                    iconData: Icons.category,
                    myController: controller.descar,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isNumbner: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "item count",
                    labelText: "Item count",
                    iconData: Icons.countertops_outlined,
                    myController: controller.count,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isNumbner: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: "item price",
                    labelText: "Item price",
                    iconData: Icons.category,
                    myController: controller.price,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isNumbner: true,
                  ),
                  CustomTextFormGlobal(
                    hintText: "Item discount",
                    labelText: "Item discount",
                    iconData: Icons.discount_outlined,
                    myController: controller.discount,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isNumbner: true,
                  ),
                  ///////////////////////////////////////////////
                  CustomDropDownSearch(
                    title: "Choose Category",
                    listdata: controller.dropdownlist,
                    dropdownSelectedName: controller.catname!,
                    dropdownSelectedID: controller.catid!,
                  ),
                  ///////////////////////////////////////////////
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      onPressed: () {
                        // controller.showOptionImage();
                      },
                      child: const Text("Choose Item image"),
                    ),
                  ),

                  if (controller.file != null)
                    Image.file(
                      controller.file!,
                      height: 60,
                      width: 60,
                    ),
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.editData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
