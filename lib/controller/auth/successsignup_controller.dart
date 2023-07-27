import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  late TextEditingController email;
  //
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
