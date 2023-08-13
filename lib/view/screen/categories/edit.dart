import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/categories/edit_controller.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CategoriesEditController controller = Get.put(CategoriesEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Category"),
      ),
      body: GetBuilder<CategoriesEditController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    hintText: "Add the Category",
                    labelText: "Category name",
                    iconData: Icons.category,
                    myController: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isNumbner: false,
                  ),
                  CustomTextFormGlobal(
                    hintText: "Add the Category (Arabic)",
                    labelText: "Category name (Arabic)",
                    iconData: Icons.category,
                    myController: controller.namear,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isNumbner: false,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      onPressed: () {
                        controller.chooseImage();
                      },
                      child: const Text("Choose category image"),
                    ),
                  ),
                  if (controller.file != null)
                    SvgPicture.file(
                      controller.file!,
                      height: 60,
                      width: 60,
                    ),
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.editData();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
