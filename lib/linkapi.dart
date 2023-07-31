class AppLink {
  //
  static const String server = "https://zaidountest.online/ecommerce7/admin";

  //

  // ===================== Images ========================//
  static const String imagestatic =
      "https://zaidountest.online/ecommerce7/upload";
  static const String imageCategories = "$imagestatic/categories";
  static const String imageItems = "$imagestatic/items";

  // ===================== Test ========================//
  static const String test = "$server/test.php";

  // ===================== Auth ========================//
  // static const String signUp = "$server/delivery/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodeSignup = "$server/auth/verifycode.php";
  static const String resend = "$server/auth/resend.php";

  // ===================== ForgetPassword ========================//
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";

  // ===================== Home ========================//

  static const String homePage = "$server/home.php";

  // ===================== Checkout ========================//
  static const String viewpendingOrders = "$server/orders/pending.php";
  static const String viewacceptedOrders = "$server/orders/accepted.php";
  static const String approveOrder = "$server/orders/approve.php";
  static const String viewaechiveOrders = "$server/orders/archive.php";
  static const String detailsOrders = "$server/orders/details.php";
  static const String doneOrders = "$server/orders/done.php";
  // ===================== Notification ========================//
  static const String notification = "$server/notification.php";

  // ===================== Categories ========================//
  static const String categoriesview = "$server/categories/view.php";
  static const String categoriesadd = "$server/categories/add.php";
  static const String categoriesedit = "$server/categories/edit.php";
  static const String categoriesedelete = "$server/categories/delete.php";

  // ===================== Items ========================//
  static const String itemsview = "$server/items/view.php";
  static const String itemsadd = "$server/items/add.php";
  static const String itemsedit = "$server/items/edit.php";
  static const String itemsdelete = "$server/items/delete.php";
}
