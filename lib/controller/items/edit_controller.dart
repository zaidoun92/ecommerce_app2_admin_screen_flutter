import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;

  late TextEditingController name;
  late TextEditingController namear;

  ItemsModel? itemsModel;

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
        "imageold": itemsModel!.itemsImage,
        "id": itemsModel!.itemsId.toString(),
      };

      var response = await itemsData.edit(data, file);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        //
        if (response['status'] == "success") {
          //
          Get.offNamed(AppRoute.itemsview);
          ItemsController c = Get.find();
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
    itemsModel = Get.arguments['itemsModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    super.onInit();
  }
}
