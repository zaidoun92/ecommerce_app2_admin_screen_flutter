import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screen/orders/accepted.dart';
import '../../view/screen/orders/archive.dart';
import '../../view/screen/orders/pending.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int i);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView(),
  ];

///////////////////////////////////////////////////
  List bottomappbar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_shopping_cart_outlined},
    {"title": "Archive", "icon": Icons.archive_outlined},
  ];

  //
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
