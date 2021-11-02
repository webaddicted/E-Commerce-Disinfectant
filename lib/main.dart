import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rallis/utils/common/initial_binding.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/routers_const.dart';
import 'package:rallis/utils/constant/routes_page.dart';
import 'package:rallis/utils/constant/string_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringConst.appName,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      initialBinding: InitialBinding(),
      theme: ThemeData(
        primarySwatch: ColorConst.color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RoutersConst.initialRoute,
      getPages: routesPage(),
    );
  }
}
