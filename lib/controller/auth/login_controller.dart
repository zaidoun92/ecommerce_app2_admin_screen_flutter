import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //
  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());

  showPassword() {
    isShowPassword = !isShowPassword;
    // isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  //
  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgePassword);
  }

  @override
  login() async {
    try {
      if (formstate.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await loginData.postData(
          password.text,
          email.text,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            if (response['data']['admin_approve'] == "1") {
              myServices.sharedPreferences
                  .setString("id", response['data']['admin_id']);
              String userid = myServices.sharedPreferences.getString("id")!;
              myServices.sharedPreferences
                  .setString("username", response['data']['admin_name']);
              myServices.sharedPreferences
                  .setString("email", response['data']['admin_email']);
              myServices.sharedPreferences
                  .setString("phone", response['data']['admin_phone']);
              myServices.sharedPreferences.setString("step", "2");
              FirebaseMessaging.instance.subscribeToTopic("users");
              FirebaseMessaging.instance.subscribeToTopic("users$userid");
              Get.offNamed(AppRoute.homePage);
            } else {
              Get.toNamed(AppRoute.login);
            }
          } else {
            Get.defaultDialog(
              title: "WARNING",
              middleText: "Email Or Password Not Correct",
            );
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      }
    } catch (e) {
      // ignore: avoid_print
      print("ERROR $e");
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      // print(value);
      // ignore: unused_local_variable
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
