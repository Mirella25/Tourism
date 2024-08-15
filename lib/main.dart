import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/switch_controller.dart';
import 'package:tourism_app/core/helper/getx_binding.dart';
import 'package:tourism_app/core/localization/changelocale.dart';
import 'package:tourism_app/core/localization/translation.dart';
import 'package:tourism_app/core/services/services.dart';
import 'package:tourism_app/routes.dart';

void main() async {
  AppBinding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController cont = Get.put(MyLocaleController());
    SwitchControllerImp controller = Get.put(SwitchControllerImp());
    return GetMaterialApp(
      initialRoute: '/',
      getPages: routes,
      theme: controller.initialTheme,
      debugShowCheckedModeBanner: false,
      locale: cont.initialLocale,
      translations: MyLocale(),
    );
  }
}
