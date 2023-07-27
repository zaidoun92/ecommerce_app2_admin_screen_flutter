import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/details_data.dart';
import '../../data/model/cartmodel.dart';
import '../../data/model/ordersmodel.dart';

class OrdersDetailsController extends GetxController {
  //
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  late StatusRequest statusRequest;
  List<CartModel> data = [];
  MyServices myServices = Get.find();
  //

  OrdersModel? ordersModel;

  late Completer<GoogleMapController> completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? cameraPosition;

  intialData() async {
    completercontroller = Completer<GoogleMapController>();
    if (ordersModel!.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel!.addressLat!),
            double.parse(ordersModel!.addressLang!)),
        zoom: 12.4746,
      );
      markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(double.parse(ordersModel!.addressLat!),
            double.parse(ordersModel!.addressLang!)),
      ));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getData();
    super.onInit();
  }

  /////////////////////////////////////////////////////////
  /// Orders Details
  ////////////////////////////////////////////////////////

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await ordersDetailsData.getData(ordersModel!.ordersId!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
