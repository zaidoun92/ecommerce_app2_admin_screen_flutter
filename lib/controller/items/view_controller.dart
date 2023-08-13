import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    //
    data.clear();

    statusRequest = StatusRequest.loading;

    update();

    var response = await itemsData.get();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      //
      if (response['status'] == "success") {
        //
        List datalist = response['data'];
        //
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
        //
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String id, String imagename) {
    itemsData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goToPageEdit(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsedit, arguments: {
      "itemsModel": itemsModel,
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.homePage);
    return Future.value(false);
  }
}
