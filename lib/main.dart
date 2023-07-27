import 'package:admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/intialbindings.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    //
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      // home: const Language(),
      // routes: routess,
      getPages: routes,
    );
  }
}
