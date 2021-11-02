import 'package:flutter/cupertino.dart';
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

class GridItem extends StatelessWidget {
  String title = '';

  GridItem({Key? key, required this.title}) : super(key: key);

  HomeController _homeController = Get.find();
  List<CategoryBean>? data = [];

  @override
  Widget build(BuildContext context) {
   data = prodCategoryBean();
    return Column(
      children: [
        getHeading(
            title: title,
            onClick: (String title) =>
                Get.toNamed(RoutersConst.category, arguments: [title])),
             getList()
      ],
    );
  }

  Widget getList() {
    return getStaggered(
        height: 150,
        crossAxisCount: 2,
        itemCount: 6,
        widget: (context, index) {
          CategoryBean item = data![index];
          return InkWell(
            onTap: () =>
                Get.toNamed(RoutersConst.productDetails, arguments: [title, item]),
            splashColor: ColorConst.splashColor,
            child: Container(
                margin: const EdgeInsets.all(2),
                height: 50,
                child: getCacheImage(url: item.url, height: 50)),
          );
        });
  }
}
