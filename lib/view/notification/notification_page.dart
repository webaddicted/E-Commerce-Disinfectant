import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rallis/controller/home_controller.dart';
import 'package:rallis/data/common/category_bean.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/dummy_data.dart';
import 'package:rallis/utils/constant/string_const.dart';

class NotificationPage extends GetView<HomeController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      body: createUi(size),
    );
  }

  Widget createUi(Size size) {
    return Column(
      children: [
        getAppBarWithBackBtn(title: StringConst.notification),
        const SizedBox(height: 5),
        getList(),
      ],
    );
  }

  Widget getList() {
    var notiList = categoryBean();
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: notiList.length,
        itemBuilder: (BuildContext context, int index) {
          return getNotiWidget(
              onTap: () {}, list: notiList[index], index: index);
        },
        // separatorBuilder: (BuildContext context, int index) {
        //   return Container(
        //       margin: const EdgeInsets.only(left: 8, right: 8), child: getDivider());
        // },
      ),
    );
  }

  Widget getNotiWidget({onTap, CategoryBean? list, int? index}) {
    return Card(
      // elevation: 3,
      margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTxtBlackColor(
                msg: list?.name ?? "",
                fontSize: 16,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 5),
            getTxtBlackColor(msg: StringConst.dummyTxt, fontSize: 15),
            const SizedBox(height: 3),
            Align(
                alignment: Alignment.topRight,
                child: getTxtGreyColor(msg: '25-Dec-2021')),
            const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
