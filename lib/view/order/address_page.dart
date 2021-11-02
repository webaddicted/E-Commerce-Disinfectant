import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rallis/controller/home_controller.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/string_const.dart';

class AddressPage extends GetView<HomeController> {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      body: createUi(size),
    );
  }

  Widget createUi(Size size) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            getAppBarWithBackBtn(title: StringConst.manageAddress),
            Flexible(child: noDataFound())
          ],
        ),
      ],
    );
  }
}
