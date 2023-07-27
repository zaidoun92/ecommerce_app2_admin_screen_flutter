import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  late TextEditingController email;
  //
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
