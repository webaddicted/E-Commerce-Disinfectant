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

class OrderHistoryPage extends GetView<HomeController> {
  const OrderHistoryPage({Key? key}) : super(key: key);

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
            getAppBarWithBackBtn(title: StringConst.orderHistory),
            Flexible(child: getList())
          ],
        ),
      ],
    );
  }
  Widget getList() {
    var list =categoryBean();
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount:  list.length ,
      itemBuilder: (BuildContext context, int index) {
        return getNotiWidget(
            onTap: (int index, CategoryBean list) {
              // Get.toNamed(RoutersConst.booking_details,
              //     arguments: [list.id.toString(), list.isExpandButton.toString(), list.isUpgradeButton]);
            },
            list: prodCategoryBean()[index],
            index: index);
      },
    );
  }
  Widget getNotiWidget({onTap,CategoryBean? list, int? index}) {
    var color = ColorConst.yellowColor;
      color = ColorConst.redColor;
    return InkWell(
      onTap: () {
        // onTap(index, list);
      },
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        child: Stack(
          children: [
            Container(height: 135, color: color, width: 5),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10,top: 10),
                child: getCacheImage(url: list!.url.toString(), width: 90,height: 120)),
            Padding(
              padding: const EdgeInsets.only(left: 115.0, right: 8, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTxtAppColor(
                      msg: "#6564646464646",
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getTxtBlackColor(
                          msg: list.name.toString(),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      getTxtBlackColor(
                          msg:
                          "${StringConst.RUPEE_SYMBOL} 5000",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ],
                  ),
                  const SizedBox(height: 5),
                  getTxtBlackColor(
                      msg:
                      "Order Qty: 5"),
                  const SizedBox(height: 5),
                  getTxtBlackColor(
                      msg:
                      "Prduct Size : XXL"),
                  const SizedBox(height: 5),
                    getTxtBlackColor(
                        msg:
                        "Booking Status : In-Complete",fontWeight: FontWeight.w600,
                        fontSize: 16),
                  const SizedBox(height: 5),
                  Align(
                      alignment: Alignment.topRight,
                      child: getTxtGreyColor(msg: '25-Dec-2021')),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
