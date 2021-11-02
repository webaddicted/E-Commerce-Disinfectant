import 'package:carousel_slider/carousel_slider.dart';
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

class BannerImgItem extends GetView<HomeController> {
  String title;

  BannerImgItem({Key? key, required this.title}) : super(key: key);
  final _current = 0.obs;
  List<CategoryBean>? data = [];
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    data = bannerProductBean();
    return Column(
      children: [
        carouselViewList(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data!.map((url) {
            int index = data!.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == _current
                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget carouselViewList() {
    return CarouselSlider.builder(
      itemCount: data!.length,
      options: CarouselOptions(
          aspectRatio: 2,
//          enlargeCenterPage: true,
          // pauseAutoPlayInFiniteScroll: true
          height: 180,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          onPageChanged: (index, reason) {
            _current.value = index;
          }),
      itemBuilder: (BuildContext context, int itemIndex, int realIndex) =>
          getSliderItem(
              itemIndex: itemIndex,
              realIndex: realIndex,
              onTap: () {
                Get.toNamed(RoutersConst.productDetails);
                // Get.toNamed(RoutersConst.detail, arguments: [title,data![itemIndex]]);
              }),
    );
  }

  Widget getSliderItem({int itemIndex = 0, int? realIndex, Function? onTap}) {
    var item = data![itemIndex];
    return Container(
      margin: const EdgeInsets.all(1),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              SizedBox(width: Get.width, child: getCacheImage(url: item.url)),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  // child: Text(
                  //   name==null?"":name,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ),
              Positioned.fill(
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: ColorConst.splashColor,
                          onTap: () => onTap!()))),
            ],
          )),
    );
  }
}
