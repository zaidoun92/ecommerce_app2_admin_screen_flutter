import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/model/categoriesmodel.dart';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<SelectedListItem> dropdownlist = [];

  StatusRequest? statusRequest = StatusRequest.none;

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

  File? file;

  showOptionImage() {
    showbottommenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("WARRNING", "Please Choose Image");
      //
      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
        "price": price.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString(),
      };

      var response = await itemsData.add(data, file!);

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

  ///////////////////////////////////////////////////
  /// Start get Categories function
  ///////////////////////////////////////////////////

  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());

    statusRequest = StatusRequest.loading;

    update();

    var response = await categoriesData.get();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      //
      if (response['status'] == "success") {
        List<CategorisModel> data = [];

        List datalist = response['data'];

        data.addAll(datalist.map((e) => CategorisModel.fromJson(e)));

        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(
            SelectedListItem(
              name: data[i].categoriesName!,
              value: data[i].categoriesId,
            ),
          );
        }
        //
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  ///////////////////////////////////////////////////
  /// END get Categories function
  ///////////////////////////////////////////////////

  @override
  void onInit() {
    getCategories();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();

    catid = TextEditingController();
    catname = TextEditingController();

    super.onInit();
  }

  showDropdown(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [
          SelectedListItem(name: "a"),
          SelectedListItem(name: "b"),
        ],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];

          dropdownname.text = selectedListItem.name;

          // showSnackBar(list.toString());
        },
        // enableMultipleSelection: false,
      ),
    ).showModal(context);
  }
}
