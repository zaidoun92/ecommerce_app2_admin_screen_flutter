import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class CategoriesEditController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  late TextEditingController name;
  late TextEditingController namear;

  CategorisModel? categorisModel;

  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      //
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
        "imageold": categorisModel!.categoriesImage,
        "id": categorisModel!.categoriesId.toString(),
      };

      var response = await categoriesData.edit(data, file);

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
    categorisModel = Get.arguments['categorisModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categorisModel!.categoriesName!;
    namear.text = categorisModel!.categoriesNameAr!;
    super.onInit();
  }
}
