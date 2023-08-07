import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  late TextEditingController name;
  late TextEditingController namear;

  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("WARRNING", "Please Choose Image SVG");
      //
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
      };

      var response = await categoriesData.add(data, file!);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        //
        if (response['status'] == "success") {
          //
          Get.offNamed(AppRoute.categoriesview);
          CategoriesController c = Get.find();
          c.getData();
          //
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
