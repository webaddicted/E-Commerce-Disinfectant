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

class WalletPage extends GetView<HomeController> {
  const WalletPage({Key? key}) : super(key: key);

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
          children: [  getAppBarWithBackBtn(title: StringConst.myWallet), getCard(), Flexible(child: getList())],
        ),
      ],
    );
  }

  Widget getList() {
    var notilist = categoryBean();
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: notilist.length,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return getWalletHistoryWidget(
            onTap: () {}, list: notilist[index], index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.only(left: 8, right: 8), child: getDivider());
      },
    );
  }

  Widget getWalletHistoryWidget({onTap, CategoryBean? list, int? index}) {
    var color = ColorConst.yellowColor;
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      child: Stack(
        children: [
          Container(height: 92, color: color, width: 7),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 5, top: 3, bottom: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTxtBlackColor(
                    msg: "Online Amount Added",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                const SizedBox(height: 5),
                getTxtBlackColor(
                    msg: "Amount : ${StringConst.RUPEE_SYMBOL} 250",
                    fontSize: 15),
                const SizedBox(height: 3),
                getTxtBlackColor(msg: "Status : Pending", fontSize: 15),
                const SizedBox(height: 3),
                Align(
                    alignment: Alignment.topRight,
                    child: getTxtGreyColor(msg: "25-Dec-2021")),
                const SizedBox(height: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCard() {
    return Card(
        elevation: 5,
        margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                getTxtBlackColor(
                    msg: 'Available Balance',
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                const SizedBox(height: 20),
                getTxtAppColor(
                    msg: '${StringConst.RUPEE_SYMBOL} 250',
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      // addMoneyDialog();
                      // final RenderBox box = Get.context.findRenderObject();
                      // Share.share('*${StringConst.INVITE_TITLE}*\n\n${StringConst.REFER_DESC}',
                      //     sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
                    },
                    clipBehavior: Clip.antiAlias,
                    child: getTxtWhiteColor(
                        msg: 'Add Money',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 14, bottom: 14),
                        primary: ColorConst.appColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ],
            )));
  }
}
