import 'package:admin/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:admin/view/screen/auth/login.dart';
import 'package:admin/view/screen/categories/add.dart';
import 'package:admin/view/screen/categories/edit.dart';
import 'package:admin/view/screen/categories/view.dart';
import 'package:admin/view/screen/home.dart';
import 'package:admin/view/screen/items/add.dart';
import 'package:admin/view/screen/items/edit.dart';
import 'package:admin/view/screen/items/view.dart';
import 'package:admin/view/screen/language.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/details.dart';
import 'package:admin/view/screen/orders/pending.dart';
import 'package:admin/view/screen/orders/screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  // GetPage(name: "/", page: () => const Cart()),

  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  // GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgePassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VeryfiyCode()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  // GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),

  // Home
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),

  //Offers
  // GetPage(name: AppRoute.offers, page: () => const OffersView()),
  // Categories
  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),

  // Items
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),

  //Orders
  GetPage(name: AppRoute.ordersscreen, page: () => const OrderScreen()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
];











// Map<String, Widget Function(BuildContext)> routess = {
//   // Auth
//   AppRoute.login: (context) => const Login(),
//   AppRoute.signUp: (context) => const SignUp(),
//   AppRoute.forgePassword: (context) => const ForgetPassword(),
//   AppRoute.resetPassword: (context) => const ResetPassword(),
//   AppRoute.verfiyCode: (context) => const VeryfiyCode(),
//   AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
//   AppRoute.successSignUp: (context) => const SuccessSignUp(),
//   AppRoute.verifyCodeSignUp: (context) => const VerifyCodeSignUp(),
//   //OnBoarding
//   AppRoute.onBoarding: (context) => const OnBoarding(),
// };
