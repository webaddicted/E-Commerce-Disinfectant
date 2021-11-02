import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rallis/controller/home_controller.dart';
import 'package:rallis/data/common/category_bean.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/dummy_data.dart';
import 'package:rallis/utils/constant/routers_const.dart';
import 'package:rallis/utils/constant/string_const.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class HorizontalListItem extends StatelessWidget {
  HorizontalListItem({Key? key, required this.title}) : super(key: key);
  String title;
  List<CategoryBean>? data = [];
  final HomeController _homeController = Get.find();
  double height = 220;
  double width = 155;

  @override
  Widget build(BuildContext context) {
    if (title == StringConst.largeHeight) {
      height = 220;
      width = 155;
    } else if (title == StringConst.smallHeight) {
      height = 100;
      width = Get.width / 1.7;
    } else if (title == StringConst.largeHeightWidth) {
      height = 170;
      width = Get.width / 1.2;
      // data = colorCategoryBean();
    } else if (title == StringConst.squre) {
      height = 170;
      width = 170;
      // data = colorCategoryBean();
    }
    data = productBean();
    return Column(
      children: [
        getHeading(
            title: title,
            onClick: (String title) => {Get.toNamed(RoutersConst.itemList)}),
        getViewList()
      ],
    );
  }

  Widget getViewList() {
    return getList(
        height: height,
        itemCount: data!.length,
        widget: (context, index) => getView(
            index: index,
            height: height,
            width: width,
            onClick: () {
              print('Send argu');
              Get.toNamed(RoutersConst.productDetails);
            }));
  }

  Widget getView(
      {int index = 0, double height = 0, double width = 0, Function? onClick}) {
    CategoryBean item = data![index];
    return Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        child: SizedBox(
            height: height,
            width: width,
            child: ClipRRect(
              child: Stack(
                children: [
                  getCacheImage(url: item.url),
                  Positioned.fill(
                      child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: ColorConst.splashColor,
                              onTap: () {
                                onClick!();
                              }))),
                ],
              ),
              borderRadius: BorderRadius.circular(5),
            )));
  }
}
