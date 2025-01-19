import 'package:flutter/material.dart';
import 'package:rallis/utils/constant/assets_const.dart';
import 'package:rallis/utils/constant/color_const.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: ColorConst.appColor,
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    fontFamily: AssetsConst.poppinsFonts,
    shadowColor: Theme.of(context).disabledColor,
    dividerColor: const Color.fromARGB(255, 112, 112, 112),
    canvasColor: Colors.white,
    scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    colorScheme: const ColorScheme.light(
            primary: ColorConst.appColor, secondary: ColorConst.appColor)
        .copyWith(surface: const Color.fromARGB(255, 255, 255, 255))
        .copyWith(error: ColorConst.redColor),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: ColorConst.appColor,
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    fontFamily: AssetsConst.poppinsFonts,
    shadowColor: Theme.of(context).disabledColor,
    dividerColor: const Color(0xff707070),
    canvasColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.dark()
        .copyWith(surface: Colors.black)
        .copyWith(error: ColorConst.redColor),
  );
}
