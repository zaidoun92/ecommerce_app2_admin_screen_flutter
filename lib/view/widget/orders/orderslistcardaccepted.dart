import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../controller/orders/accepted_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrdersListAccepted extends GetView<OrdersAcceptedController> {
  final OrdersModel listdata;
  const CardOrdersListAccepted({
    super.key,
    required this.listdata,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${listdata.ordersId}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                // Text(listdata.ordersDatetime!),
                Text(
                  Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            // Text(
            //     "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
            Text("Order Price : ${listdata.ordersPrice} \$"),
            Text("Delivery Price : ${listdata.ordersPricedelivery} \$"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
            // Text(
            //     "Orders Status : ${controller.printOrdersStatus(listdata.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${listdata.ordersTotalprice} \$",
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(
                      AppRoute.ordersdetails,
                      arguments: {
                        "ordersmodel": listdata,
                      },
                    );
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                  child: const Text("Details"),
                ),
                const SizedBox(width: 10),
                if (listdata.ordersStatus == "1")
                  MaterialButton(
                    onPressed: () {
                      controller.donePrepare(
                        listdata.ordersId!,
                        listdata.ordersUsersid!,
                        listdata.ordersType!,
                      );
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Done"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
