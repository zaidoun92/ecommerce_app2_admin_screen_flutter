import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategorisModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    //
    data.clear();

    statusRequest = StatusRequest.loading;

    update();

    var response = await categoriesData.get();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      //
      if (response['status'] == "success") {
        //
        List datalist = response['data'];
        //
        data.addAll(datalist.map((e) => CategorisModel.fromJson(e)));
        //
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
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
