import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rallis/utils/common/initial_binding.dart';
import 'package:rallis/utils/constant/routers_const.dart';
import 'package:rallis/utils/constant/routes_page.dart';
import 'package:rallis/utils/constant/string_const.dart';
import 'package:rallis/utils/theme/app_theme.dart';
import 'package:rallis/view/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: StringConst.appName,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        initialBinding: InitialBinding(),
        initialRoute: RoutersConst.initialRoute,
        themeMode: ThemeMode.light,
        unknownRoute:
            GetPage(name: RoutersConst.initialRoute, page: () => SplashPage()),
        darkTheme: lightThemeData(context),
        theme: lightThemeData(context),
        getPages: routesPage());
  }
}
