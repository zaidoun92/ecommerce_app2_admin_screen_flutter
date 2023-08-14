import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<SelectedListItem> dropdownlist = [];

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;

  late TextEditingController name;
  late TextEditingController namear;

  late TextEditingController desc;
  late TextEditingController descar;

  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  TextEditingController? catname;
  TextEditingController? catid;

  StatusRequest? statusRequest = StatusRequest.none;

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
        "price": price.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString(),
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
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();

    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    count.text = itemsModel!.itemsCount!;
    price.text = itemsModel!.itemsPrice!;
    discount.text = itemsModel!.itemsDiscount!;
    catid!.text = itemsModel!.categoriesId!;
    catname!.text = itemsModel!.categoriesName!;

    super.onInit();
  }
}
