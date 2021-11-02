
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rallis/controller/home_controller.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/string_const.dart';

class SurveyPage extends GetView<HomeController> {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      body: createUi(),
    );
  }
  Widget createUi() {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            getAppBarWithBackBtn(title: StringConst.survey),
            Flexible(child: noDataFound())
          ],
        ),
      ],
    );
  }
}

