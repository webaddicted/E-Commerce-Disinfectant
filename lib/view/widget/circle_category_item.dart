import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rallis/controller/home_controller.dart';
import 'package:rallis/data/common/category_bean.dart';
import 'package:rallis/utils/common/widget_helper.dart';
import 'package:rallis/utils/constant/color_const.dart';
import 'package:rallis/utils/constant/dummy_data.dart';
import 'package:rallis/utils/constant/routers_const.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class CircleCategoryItem extends StatelessWidget {
  String title = '';

  CircleCategoryItem({Key? key, required this.title}) : super(key: key);

  final HomeController _homeController = Get.find();

  double height = 100;
  double width = 100;
  var data = [];

  @override
  Widget build(BuildContext context) {
    height = 130;
    width = 130;
    data = categoryBean();
    return getListView();
  }

  Widget getListView() {
    return Column(
      children: [
        getHeading(
            title: title,
            onClick: (String title) {
              Get.toNamed(RoutersConst.category);
            }),
        getList(
            height: height,
            itemCount: data.length,
            widget: (context, index) => getView(
                index: index,
                height: 100,
                width: 100,
                onClick: () {
                  // Get.toNamed(RoutersConst.detail, arguments: [title,data[index]]);
                }))
      ],
    );
  }

  Widget getView(
      {int index = 0,
      double height = 50,
      double width = 50,
      Function? onClick}) {
    CategoryBean item;
    item = data[index] as CategoryBean;
    return Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            ClipRRect(
              child: Stack(
                children: [
                  getCacheImage(
                      url: item.url,
                      isCircle: true,
                      height: height,
                      width: width),
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
            ),
            const SizedBox(height: 5),
            getTxtBlackColor(
                msg: item.name.toString(), fontWeight: FontWeight.bold)
          ],
        ));
  }
}
